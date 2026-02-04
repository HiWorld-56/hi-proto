from setuptools import setup, find_packages

setup(
    name="hi-api-grpc-client",
    version="1.0.0",
    packages=find_packages(where="src"),
    package_dir={"": "src"},
    install_requires=[
        "protobuf>=6.33.5",
        "grpcio>=1.71.0"
    ],
    python_requires=">=3.11",
)