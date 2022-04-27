print("Q1..")
# 1. Write a python program to define an integer value and print the values.
val = 7
print(f"Value of int variable is: {val}")

print("Q2..")
# Write a python program to find addition of two integer numbers taken as input from the user.
a, b = map(int, input("Enter two numbers separated by space: ").split())
print(f"Sum of two input numbers: {a+b}")

print("Q3..")
# Write a python program to check the given year is a leap year or not.
year = int(input("Enter year: "))
if year % 4 == 0:
    print("Leap Year")
else:
    print("Not a leap year")

print("Q4..")
# Write a python program for swapping the value of two integers.
a, b = 1, 2
print(f"Before swapping the values are a={a}, b={b}")
temp = b
b = a
a = temp
print(f"After swapping, values are a={a}, b={b}")

print("Q5..")
# Write a python program for swapping the value of two integers without a third variable.
a, b = 1, 2
print(f"Before swapping the values are a={a}, b={b}")
a, b = b, a
print(f"After swapping, values are a={a}, b={b}")

print("Q6..")
# Write a python program to find the ASCII value of the given character.
c = str(input("Enter character to find its ASCII value: "))
print(f"ASCII value of char {c} is {ord(c)}")

print("Q7..")
# Write a python program to calculate the square root of a number.
a = float(input("Enter number to find its square root: "))
print(f"Square root value of {a} is {a**(0.5)}")

print("Q8..")
# Write a python program to generate a random number between 0 and 15.
import random
print(f"Random number between 0 and 15 => {random.randrange(0,15)}")

print("Q9..")
'''
Take a list of 10 numbers of your choice. Write a python program to print the following:
a. Print all the elements after 5th index
b. Print all the elements before 6th index
c. Print all the elements between 2nd and 8th indices
'''
import random
rand_list = random.sample(range(20, 70), 10)
print(f"List Numbers: {rand_list}")
print(f"Elements are 5th index: {rand_list[5:]}")
print(f"Elements before 6th index: {rand_list[:6]}")
print(f"Elements between 2nd and 8th index: {rand_list[3:8]}")

print("Q10..")
# Write a python program to find the area of triangle.
a, b, c = map(float, input("Enter sides of triangle separated by space: ").split())
p = (a+b+c)/2
area = (p*(p-a)*(p-b)*(p-c))**0.5
print(f"Area of triangle with sides {a}, {b}, {c} is: {area}")