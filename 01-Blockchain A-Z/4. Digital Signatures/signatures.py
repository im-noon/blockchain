#Signatures

from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.asymmetric import rsa
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.asymmetric import padding
from cryptography.exceptions import InvalidSignature


class Signatures(object):

    def __init__(self):
        self.private_key = ""
        self.public_key = ""

    def get_private_key(self):
        return self.private_key

    def get_public_key(self):
        return self.public_key

    def generate_key(self):
        self.private_key = rsa.generate_private_key(
            public_exponent = 65537,
            key_size = 2048,
            backend = default_backend()
        )
        self.public_key = self.private_key.public_key()

    def signing(self, message):
        message = bytes(message, encoding='utf-8')
        signature = self.private_key.sign(
            message,
            padding.PSS(
                padding.MGF1(hashes.SHA256()),
                salt_length = padding.PSS.MAX_LENGTH
            ),
            hashes.SHA256()
        )
        return signature

    def verify(self, message, signature):
        message = bytes(message, encoding='utf-8')
        try:
            self.public_key.verify(
                signature,
                message,
                padding.PSS(
                    mgf=padding.MGF1(hashes.SHA256()),
                    salt_length=padding.PSS.MAX_LENGTH
                ),
                hashes.SHA256()
            )
            return True
        except InvalidSignature:
            return False
        except:
            print("Error executing public_key.verify")
            return False


if __name__ == "__main__":
    signatures1 = Signatures()
    signatures1.generate_key()

    pr = signatures1.get_private_key()
    pu = signatures1.get_public_key()

    message = "This is secrete message"
    sig1 = signatures1.signing(message)
    print(sig1)
    correct = signatures1.verify(message, sig1)
    print("=======================================")
    print("| verify signature1 message")
    print("=======================================")
    if correct:
        print("Success! Good signature")
    else:
        print("ERROR! Signature is bad")

    signatures2 = Signatures()
    signatures2.generate_key()

    pr2 = signatures2.get_private_key()
    pu2 = signatures2.get_public_key()

    print("=======================================")
    print("| verify signature2 message")
    print("=======================================")
    sig2 = signatures2.signing(message)
    print(sig2)
    correct = signatures2.verify(message, sig2)
    if correct:
        print("Success! Good signature")
    else:
        print("ERROR! Signature is bad")

    print("=======================================")
    print("| verify bad message")
    print("=======================================")
    badmess = message + "Q"
    correct = signatures2.verify(badmess, sig2)
    if correct:
        print("Success! Good signature")
    else:
        print("ERROR! Temparing detected")