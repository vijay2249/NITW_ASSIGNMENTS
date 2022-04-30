#include<iostream>
using namespace std;

struct student{
  int id;
  char name[50];
};

int main(){
  struct student S;
  int age;cin >> age;
  int rollno = 5;
  age += rollno;
  cout<<age;
  for(int i=0; i<10;i++){age++;
  int marks = 6;
  while (marks > 0){
    age--;
    marks--;
  }
  if (age > 7){
    cout << age;
  }else{
    age++;
    cout << age;
  }
  return 0;
}