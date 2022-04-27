print("Q1...")
l = [
  'string',
  [False, {11, 'd'}], 
  {'Name': "Christopher"},
  True,
  [1],
  2407,
  ("String", [False, 44]),
  22.407,
  b'thisIsAwesome'
]

print("Q1(a)..")
print(f"Length of list: {len(l)}\n") #expected answer: 9
print("Q1(b)..")
print(f"Last element in the list: {l[-1]}\n") #b'thisIsAwesome'
print("Q1(c)..")
print("Adding '1971' string to list")
l.append("1971")
print(f"List after appending element: \n{l}\n")
print("Q1(d)..")
temp_list = ["DSC_LAB", "CSE-A"]
print(f"temp list to extend list: {temp_list}\n")
l.extend(temp_list)
print(f"List after extend: \n{l}\n")
print("Q1(e)..")
newList = [1,2,3]
print(f"List used: {newList}\n")
l.append(newList)
print(f"List after appending new List: \n{l}\n")
print("Q1(f)..")
print(f"Index of element 'string' in list: {l.index('string')}\n") #0
print(f"Index of number 2407 in list: {l.index(2407)}\n") #5
print(f"Index of list [1] in list: {l.index([1])}\n") #4
print("Q1(g)..")
print("Inserting 'Hello there' element in index 2\n")
l.insert(2, ("Hello there"))
print(f"List after insert operation: \n{l}\n") #inserted in index 2
print("Q1(h)..")
print(f"List before replacement: \n{l}\n")
l[0] = "Assignment2"
print(f"List after replacing 0th index element: \n{l}\n") #replaced index 0
print("Q1(i)..")
print("Appending 'NIT' element twice\n")
l.append('NIT')
l.append('NIT')
print(f"List after appending 'NIT' element: \n{l}\n")
print("Q1(j)..")
print("Removing the element in 4th index of list\n")
l.pop(4)
print(f"List after removing 4th index element: \n{l}\n")
print("Q1(k)..")
import random
rList = random.sample(range(10, 30), 5)
print(f"before sort: \n{rList}\n")
rList.sort()
print(f"After sort: \n{rList}\n")
print("Q1(l)..")
print(f"Before reversing the list: \n{l}\n")
l.reverse()
print(f"After reversing the list: \n{l}\n")

print("\n\nQ2...\n")
newTuple = (
  1,False,3,12,[],2,2, 
  {3,2,1,False},
  ['laugh'],
  {"Age": 23}
)
print(f"newTuple contains elements: \n{newTuple}\n")
print(f"Number of times number 2 repeated in the tuple newTuple is: {newTuple.count(2)}")
print(f"Index of empty list [] in the tuple: {newTuple.index([])}")

print("\n\nQ3...\n")
set1 = {"laugh", False, 24, 'one'}
set2 = {"laugh", False, 24.07}

print("Q3(a)..")
print(f"set1 intersection set2: {set1 & set2}\n")
unionSet = set1.union(set2)
print(f"set1 union set2: {unionSet}\n")

print("Q3(b)..")
set1.add(1)
print(f"after adding number 1 to set1: \n{set1}")
set2.update(set([1, 2, 3]))
print(f"after updating set2 : \n{set2}\n")

print("Q3(c)..")
print(f"set1-set2 operation result: \n{set1.difference(set2)}\n")

print("Q3(d)..")
print(f"symmectric difference of set1 and set2 result: \n{set1.symmetric_difference(set2)}\n")
