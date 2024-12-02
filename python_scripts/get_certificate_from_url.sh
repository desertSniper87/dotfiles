#!/usr/bin/env python3

from OpenSSL import SSL, crypto
import socket
from urllib.parse import urlparse
import re

def is_valid_hostname(hostname):
    """
    Validate hostname using regex pattern
    """
    hostname_pattern = re.compile(
        r'^(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*'
        r'([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\-]*[A-Za-z0-9])$'
    )
    return bool(hostname_pattern.match(hostname))

def parse_url(url):
    """
    Parse and validate URL, returning hostname and port
    """
    # Add https:// if no scheme is provided
    if not url.startswith(('http://', 'https://')):
        url = 'https://' + url

    parsed = urlparse(url)
    hostname = parsed.hostname


    # Get port, default to 443 for https and 80 for http
    port = parsed.port
    if port is None:
        port = 443 if parsed.scheme == 'https' else 80

    if not hostname or not is_valid_hostname(hostname):
        raise ValueError("Invalid hostname")

    return hostname, port

def get_server_certificate(hostname, port=443):
    """
    Connect to a server and get its certificate information
    """
    # Create a context with more permissive settings
    context = SSL.Context(SSL.TLS_CLIENT_METHOD)
    # context.set_verify(SSL.VERIFY_NONE)  # Don't verify certificate chain
    # context.set_options(SSL.OP_NO_SSLv2 | SSL.OP_NO_SSLv3)  # Disable older SSL versions

    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    try:
        print(f"Connecting to {hostname}:{port}...")
        sock.connect((hostname, port))

        connection = SSL.Connection(context, sock)
        connection.set_tlsext_host_name(hostname.encode())
        connection.set_connect_state()

        print("Performing SSL handshake...")
        try:
            connection.do_handshake()
        except SSL.Error as e:
            if "unknown protocol" in str(e).lower():
                raise SSL.Error("Server doesn't support SSL/TLS or port might be wrong")
            elif "certificate verify failed" in str(e).lower():
                raise SSL.Error("Certificate verification failed - the certificate might be self-signed or invalid")
            else:
                raise

        print("Getting certificate information...")
        cert = connection.get_peer_certificate()

        if cert is None:
            raise SSL.Error("No certificate was provided by the server")

        text = crypto.dump_certificate(crypto.FILETYPE_TEXT, cert).decode('utf-8')
        return text

    except socket.gaierror:
        raise ConnectionError(f"Could not resolve hostname: {hostname}")
    except socket.timeout:
        raise ConnectionError("Connection timed out")
    except ConnectionRefusedError:
        raise ConnectionError(f"Connection refused - port {port} might be closed or filtered")
    except SSL.Error as e:
        raise SSL.Error(f"SSL error occurred: {str(e)}")
    except Exception as e:
        raise Exception(f"An error occurred: {str(e)}")

    finally:
        sock.close()

def main():
    while True:
        try:
            # Get user input
            url = input("\nEnter URL (or 'quit' to exit): ").strip()

            if url.lower() == 'quit':
                print("Exiting...")
                break

            if not url:
                print("Please enter a URL")
                continue

            # Parse and validate URL
            hostname, port = parse_url(url)
            print(f"\nInitiating connection to {hostname}:{port}")

            # Get and display certificate
            cert_info = get_server_certificate(hostname, port)
            print("\nCertificate Information:")
            print("-" * 50)
            print(cert_info)

        except ValueError as e:
            print(f"Error: {str(e)}")
        except ConnectionError as e:
            print(f"Connection Error: {str(e)}")
        except SSL.Error as e:
            print(f"SSL Error: {str(e)}")
        except Exception as e:
            print(f"Unexpected Error: {str(e)}")
            print("Please check if the URL is correct and the server is accessible")

if __name__ == "__main__":
    main()
