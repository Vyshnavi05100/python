class Node:
    def __init__(self,data):
        self.data =data
        self.left=None
        self.right=None

class bst:
    def __init__(self):
        self.root = None

    def insert(self,data):
        self.root = self.rec_insert(self.root,data)

    def rec_insert(self,root,data):

        if root is None:
            return Node(data)
        if root.data >data:
            root.left = self.rec_insert(root.left,data)
        else:
            root.right = self.rec_insert(root.right,data)
        return root

    def inorder(self):
        def rec_inorder(root):
            if root:
                rec_inorder(root.left)
                print(root.data,end=" ")
                rec_inorder(root.right)
        rec_inorder(self.root)

    def sum(self,root):
        if not root:  return 0
        return root.data + self.sum(root.left) + self.sum(root.right)

    def count(self, root):
        if not root:  return 0
        return 1 + self.count(root.left) + self.count(root.right)

    def height(self, root):
        if not root:  return 0
        return 1 + max(self.height(root.left) , self.height(root.right))

    def left_sum(self,root):
        if root is None:
            return 0
        total = 0
        if root.left:
            total += root.left.data
        total += self.left_sum(root.left)
        total += self.left_sum(root.right)
        return total

    def right_sum(self,root):
        if root is None:
            return 0
        rightsum= self.sum(root) - self.root.data - self.left_sum(root)
        return rightsum

    def min(self,root):
        if root is None:
            print("no data")
        while root.left:
            root = root.left
        return root.data

    def max(self, root):
        if root is None:
            print("no data")
        while root.right:
            root = root.right
        return root.data

    def find(self,root,key):
        if root is None or root.data == key:
            return root
        if key < root.data:
            return self.find(root.left,key)
        else:
            return self.find(root.right,key)

    def delete(self,key):
        self.root = self.rec_delete(self.root,key)
    def rec_delete(self,root,key):
        if root:
            if root.data > key:
                root.left = self.rec_delete(root.left,key)
            elif root.data < key:
                root.right = self.rec_delete(root.right,key)
            else:
                if root.left is None:
                    return root.right
                elif root.right is None:
                    return root.left
    
                max_val = self.max(root.left)
                root.data = max_val
                self.rec_delete(root.left,max_val)
            return root


obj = bst()
obj.insert(25)
obj.insert(60)
obj.insert(70)
obj.insert(6)
obj.insert(4)
obj.insert(30)
obj.insert(29)
obj.insert(10)
obj.insert(40)
obj.insert(5)
obj.inorder()
print()
obj.delete(6)
obj.inorder()
