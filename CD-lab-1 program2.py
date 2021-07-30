'''

                            Online Python Compiler.
                Code, Compile, Run and Debug python program online.
Write your code in this editor and press "Run" button to execute it.

'''
print("Enter your input in the form of binary string:")
a=str(input())
c=a[-1]
d=a[-2]
if(c == d):
    print("String Accepted")
else:
   print("String Not Accepted")  
