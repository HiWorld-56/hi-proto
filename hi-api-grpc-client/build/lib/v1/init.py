"""
Hi api grpc client package
A comprehensive service package with AI, Club, DID modules and gRPC support.
"""

__version__ = "1.0.0"
__author__ = "Your Name"

# 导出主要模块
from . import ai
from . import club
from . import did
from . import source

# 导出protobuf生成的模块
from . import hi_pb2
from . import hi_pb2_grpc

# 如果有主要的类或函数，可以在这里导出
# from .main import SomeClass, some_function

__all__ = [
    'ai',
    'club', 
    'did',
    'source',
    'hi_pb2',
    'hi_pb2_grpc',
]