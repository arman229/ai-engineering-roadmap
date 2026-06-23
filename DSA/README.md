
# Data Structures and Algorithms (DSA)

## What is DSA?

### Data Structure

A **Data Structure** is a way of organizing and storing data so that it can be accessed and modified efficiently.

### Algorithm

An **Algorithm** is a step-by-step procedure used to solve a problem or perform a task.

---

# Types of Data Structures

Data structures are mainly divided into two categories:

```text
Data Structures
│
├── Linear Data Structures
│   ├── Array
│   ├── String
│   ├── Linked List
│   ├── Stack
│   ├── Queue
│   └── Deque
│
└── Non-Linear Data Structures
    ├── Tree
    ├── Heap
    ├── Trie
    ├── Graph
    ├── HashMap
    └── HashSet
```

---

# Linear Data Structures

In a **Linear Data Structure**, elements are arranged sequentially, one after another.

Examples:

* String
* Array
* Linked List
* Stack
* Queue
* Deque

---

# Non-Linear Data Structures

In a **Non-Linear Data Structure**, elements are not arranged sequentially. One element may connect to multiple other elements.

Examples:

* Trees
* Heaps
* Tries
* Graphs
* HashMap
* HashSet

---

# 1. String

## Definition

A **String** is a sequence of characters stored in order.

```python
s = "Arman Ashraf"
```

### Example

```text
Index: 0 1 2 3 4
Value: H e l l o
```

---

## Common Operations

* Access character by index
* Concatenation
* Slicing
* Searching
* Replacing

---

## Applications

* Text processing
* Password validation
* Search engines

---

# 2. Array

## Definition

An **Array** stores elements in contiguous memory locations and provides index-based access.

```python
arr = [10, 20, 30, 40]
```

---

## Static Array

Fixed size array.

Example:

```text
[10, 20, 30, 40]
```

Size cannot change.

---

## Dynamic Array

Can grow or shrink during runtime.

Python lists are dynamic arrays.

```python
arr = []

arr.append(10)
arr.append(20)
```

---

## Advantages

* Fast access by index.
* Easy traversal.

---

## Disadvantages

* Insertion and deletion in the middle can be expensive.

---

## Applications

* Storing lists of data
* Matrices
* Image processing

---

# 3. Linked List

## Definition

A **Linked List** is a collection of nodes.

Each node contains:

1. Data
2. Address of the next node

```text
10 → 20 → 30 → None
```

---

## Node Structure

```python
class Node:
    def __init__(self, data):
        self.data = data
        self.next = None
```

---

# Types of Linked Lists

## Singly Linked List

Each node points to the next node.

```text
10 → 20 → 30 → None
```
## Example 

```python
class Node:
    def __init__(self, data):
        self.data = data
        self.next = None


class LinkedList:
    def __init__(self):
        self.head = None

    def append(self, data):
        new_node = Node(data)

        if not self.head:
            self.head = new_node
            return

        temp = self.head
        while temp.next:
            temp = temp.next
        temp.next = new_node

    def display(self):
        temp = self.head
        while temp:
            print(temp.data, end=" -> ")
            temp = temp.next
        print("None")


ll = LinkedList()
ll.append(10)
ll.append(20)
ll.append(30)
ll.display() 

```

---

## Doubly Linked List

Each node contains:

* Previous pointer
* Next pointer

```text
None ← 10 ⇄ 20 ⇄ 30 → None
```
## Example 



```python
class Node:
    def __init__(self, data):
        self.data = data
        self.next = None
        self.prev = None


class DoublyLinkedList:
    def __init__(self):
        self.head = None

    def append(self, data):
        new_node = Node(data)

        if not self.head:
            self.head = new_node
            return

        temp = self.head
        while temp.next:
            temp = temp.next

        temp.next = new_node
        new_node.prev = temp
 

```

---

## Circular Linked List

The last node points back to the head.

```text
10 → 20 → 30
↑         ↓
←─────────
```

## Example
```python

class Node:
    def __init__(self, data):
        self.data = data
        self.next = None


class CircularLinkedList:
    def __init__(self):
        self.head = None

    def append(self, data):
        new_node = Node(data)

        if not self.head:
            self.head = new_node
            new_node.next = self.head
            return

        temp = self.head
        while temp.next != self.head:
            temp = temp.next

        temp.next = new_node
        new_node.next = self.head
```

---

## Applications

* Music playlists
* Browser history

---

# 4. Stack

## Definition

A **Stack** is a linear data structure that follows:

### LIFO (Last In, First Out)

The last element inserted is the first one removed.

```text
Top
↓
30
20
10
```

---

## Operations

### Push

Add an element.

```python
stack.append(10)
```

---

### Pop

Remove the top element.

```python
stack.pop()
```

---

### Peek

View the top element without removing it.

```python
stack[-1]
```

---

## Implementation

```python
stack = []

stack.append(10)
stack.append(20)

print(stack.pop())
```

Output:

```python
20
```

---

## Applications

### Undo/Redo

* Text editors
* Photo editing applications

### Function Call Stack

Programming languages use stacks internally.


---

# 5. Queue

## Definition

A **Queue** follows:

### FIFO (First In, First Out)

The first element inserted is the first one removed.

```text
Front → 10 → 20 → 30 ← Rear
```

## Example
```python
class LinearQueue:
    def __init__(self):
        self.queue = []

    def enqueue(self, value):
        self.queue.append(value)

    def dequeue(self):
        if self.queue:
            return self.queue.pop(0)
        return "Empty" 

```

---

## Operations

### Enqueue

Insert element.

```python
queue.append(10)
```

---

### Dequeue

Remove front element.

```python
queue.pop(0)
```

---

### Peek

Return front element.

---

### isEmpty

Check whether queue is empty.

---

### Size

Return number of elements.

---

## Applications

* Printer scheduling
* Ticket booking systems
* CPU scheduling

---

# 6. Deque (Double-Ended Queue)

## Definition

A **Deque** allows insertion and deletion from both ends.

```text
Front ⇄ 10 ⇄ 20 ⇄ 30 ⇄ Rear
```



## Example

```python

from collections import deque

dq = deque()

dq.append(10)       # rear insert
dq.append(20)
dq.appendleft(5)    # front insert

print(dq)  # deque([5, 10, 20])

dq.pop()            # removes 20 (rear)
dq.popleft()       # removes 5 (front)

```
---

## Types

### Input Restricted Deque

Insert only from rear.

Delete from both ends.

---

### Output Restricted Deque

Insert from both ends.

Delete only from front.

---

## Applications

* Browser history
* Sliding window problems
* Task scheduling

---

# 7. HashMap

## Definition

A **HashMap** stores data as:

```text
Key → Value
```

using a hashing technique.

---

## Example

```python
student = {
    "name": "Arman",
    "age": 23
}
```

---

## Common Operations

* Insert
* Search
* Update
* Delete

---

## Applications

* Database indexing
* Caching
* Frequency counting
* Fast lookup systems

---

# 8. HashSet

## Definition

A **HashSet** stores only unique values.

Duplicates are automatically removed.

---

## Example

```python
nums = {1, 2, 3, 2, 1}

print(nums)
```

Output:

```python
{1, 2, 3}
```

---

## Applications

* Remove duplicates
* Membership checking
* Union and intersection operations

---

# 9. Graph

## Definition

A **Graph** is a collection of:

1. Vertices (Nodes)
2. Edges (Connections)

```text
A ----- B
|       |
|       |
C ----- D
```

---

## Graph Node

```python
class GraphNode:
    def __init__(self, val):
        self.val = val
        self.neighbors = []
A = GraphNode("A")
B = GraphNode("B")

A.neighbors.append(B)
B.neighbors.append(A)
```

---

# Terminology

## Adjacent Node

Two nodes connected by an edge.

---

## Degree

Number of edges connected to a node.

---

## Path

Sequence of connected nodes.

```text
A → B → C → D
```

---

## Directed Graph

Edges have direction.

```text
A → B → C
```

Example:

Instagram followers.

---

## Undirected Graph

Edges have no direction.

```text
A ----- B
```

Example:

Facebook friendship.

---

## Weighted Graph

Edges contain weights.

```text
A ----5---- B
```

Weights may represent:

* Distance
* Cost
* Time

---

## Unweighted Graph

Edges only represent connections.

---

## Cycle

A path that returns to the starting node.

---

## Cyclic Graph

Contains one or more cycles.

---

## Acyclic Graph

Contains no cycles.

---

## Applications

* Google Maps
* Social networks
* Recommendation systems
* Computer networks

---

# 10. Tree

## Definition

A **Tree** is a hierarchical, non-linear data structure.

```text
        A
       / \
      B   C
     / \
    D   E
```

---

## Terminology

### Root

Topmost node.

### Parent

Node that has children.

### Child

Node connected below a parent.

### Leaf Node

Node with no children.

### Height

Longest path from root to leaf.

---

## Python Implementation

```python
class TreeNode:
    def __init__(self, val):
        self.val = val
        self.left = None
        self.right = None
root = TreeNode("A")

root.left = TreeNode("B")
root.right = TreeNode("C")

root.left.left = TreeNode("D")
root.left.right = TreeNode("E")
```

---

## Applications

* File systems
* Organization charts
* HTML DOM
* XML parsing

---

# 11. Heap

## Definition

A **Heap** is a special type of complete binary tree used to efficiently access the minimum or maximum element.

---

# Types of Heap

## Min Heap

Parent ≤ Children

```text
        10
       / \
      20 30
```

Smallest element remains at the root.

---

## Max Heap

Parent ≥ Children

```text
        50
       / \
      30 20
```

Largest element remains at the root.

---

## Python Example

```python
import heapq

heap = []

heapq.heappush(heap, 20)
heapq.heappush(heap, 10)

print(heap)
```

Output:

```python
[10, 20]
```

---

## Applications

* Priority queues
* Dijkstra's algorithm
* CPU scheduling
* Top-K problems

---

# 12. Trie (Prefix Tree)

## Definition

A **Trie** stores strings character by character and efficiently handles prefix-based searching.

---

## Example

Words:

```text
cat
car
can
```

Structure:

```text
       root
         |
         c
         |
         a
       / | \
      t  r  n
```

---

## Node Structure

```python
class TrieNode:
    def __init__(self):
        self.children = {}
        self.is_end = False
class Trie:
    def __init__(self):
        self.root = TrieNode()

    def insert(self, word):
        node = self.root

        for char in word:
            if char not in node.children:
                node.children[char] = TrieNode()

            node = node.children[char]

        node.is_end = True
trie = Trie()

trie.insert("cat")
```

---

## Applications

### Autocomplete

Google search suggestions.

---

### Dictionary

Fast word lookup.

---

### Spell Checker

Suggest correct words.

---

### IP Routing

Prefix matching.

---

# Summary

| Data Structure | Category   | Main Feature              | Real-World Use     |
| -------------- | ---------- | ------------------------- | ------------------ |
| String         | Linear     | Sequence of characters    | Text processing    |
| Array          | Linear     | Index-based access        | Lists, matrices    |
| Linked List    | Linear     | Dynamic memory allocation | Browser history    |
| Stack          | Linear     | LIFO                      | Undo/Redo          |
| Queue          | Linear     | FIFO                      | Ticket systems     |
| Deque          | Linear     | Insert/Delete both ends   | Sliding window     |
| HashMap        | Non-Linear | Key-Value storage         | Caching            |
| HashSet        | Non-Linear | Unique elements           | Remove duplicates  |
| Graph          | Non-Linear | Network relationships     | Maps, social media |
| Tree           | Non-Linear | Hierarchical structure    | File systems       |
| Heap           | Non-Linear | Priority management       | Scheduling         |
| Trie           | Non-Linear | Prefix searching          | Autocomplete       |

---
 