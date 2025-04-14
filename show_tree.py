import os
# 用 Python 脚本生成目录结构
def print_tree(startpath, prefix=""):
    for item in os.listdir(startpath):
        path = os.path.join(startpath, item)
        if os.path.isdir(path):
            print(prefix + "├── " + item)
            print_tree(path, prefix + "│   ")
        else:
            print(prefix + "├── " + item)

print_tree(".")
