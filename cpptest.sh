#!/bin/bash
#-------------------------------------------------------------------
# just a simple C++ test. most of the code are from the internet :D
#-------------------------------------------------------------------

cat << EOF |
/**
 * compile with -std=c++11
 */

#include <iostream>
#include <vector>
#include <list>
#include <forward_list>

using namespace std;

template <class T>
T add(T a, T b)
{
    return a + b;
}

int main()
{
    double d1 = 2.3;
    double d2 = 3.4;
    cout << add(d1, d2) << endl;

    int i1 = 4;
    int i2 = 5;
    cout << add(i1, i2) << endl;

    vector<int> a;
    a.push_back(1);
    a.push_back(2);
    a.push_back(3);
    a.push_back(4);
    a.push_back(5);

    for (vector<int>::const_iterator i = a.begin(); i != a.end() ; ++i)
    {
        cout << (*i) << endl;
    }
    cout << endl;

    list<int> l;
    l.push_front(1);
    l.push_back(2);

    for (auto i = l.begin(); i != l.end(); i++)
    {
        cout << (*i) << endl;
    }
    cout << endl;

    forward_list<int> j;
    j.push_front(2);
    j.push_front(1);

    for (forward_list<int>::iterator i = j.begin(); i != j.end(); i++)
    {
        cout << (*i) << endl;
    }

    return 0;
}
EOF
g++ -std=c++11 -Wall -s -o cpptest -x c++ -
if [ $? -eq 0 ]; then
  ./cpptest
  echo "cleaning up..."
  rm cpptest
fi
