#include<iostream>
#include<string.h>


using namespace std;

class Mystring {
private:
	char* s;
	int len;

public:
	Mystring() {
		len = 0;
		s = new char[1];
		*s = '\0';
		cout << "默认构造了Mystring" << endl;
	}//默认构造函数

	Mystring(const char* ns) {
		len = strlen(ns);
		s = new char[len + 1];
		for (unsigned int i = 0; i < len; i++)
			s[i] = ns[i];
		s[len] = '\0';
		cout << "构造了Mystring" << endl;
	}//构造函数,用指针ns所指的字符串常量初始化Mystring类的对象


	Mystring(const Mystring& a) {
		len = strlen(a.s);
		s = new char[len + 1];
		for (unsigned int i = 0; i < len; i++)
			s[i] = a.s[i];
		s[len] = '\0';
		cout << "复制构造了Mystring" << endl;
	}//复制构造函数

	~Mystring() {
		//delete s;
		cout << "删除了Mytring" << endl;
	}//析构函数

	char* pri()
	{
		return s;
	}//返回类的数组头地址

	Mystring append(const char* t);//将字符串t添加在本串尾

	Mystring& insert(unsigned int i, const char* t);//将字符串s插入在本串位置i之前

	Mystring substr(unsigned int i, unsigned int n);//取本串中位置i开始的第n个字符

};


Mystring Mystring::append(const char* t)
{
	Mystring curs;
	len += strlen(t);
	curs.s = new char[len + 1];
	int i, j;
	for (i = 0; s[i]; i++)
		curs.s[i] = s[i];
	for (j = 0; t[j]; j++)
		curs.s[i + j] = t[j];
	curs.s[len] = '\0';

	puts(curs.s);

	return curs;
}

Mystring& Mystring::insert(unsigned int i, const char* t)
{
	Mystring current;
	current.len = len + strlen(t);
	current.s = new char[current.len + 1];
	int k, j, p;
	for (k = 0; k < i; k++)
		current.s[k] = s[k];
	for (j = 0; t[j]; j++)
		current.s[k + j] = t[j];
	for (p = i; s[p]; p++)
		current.s[p + j] = s[p];
	current.s[len] = '\0';

	puts(current.s);

	return current;
}

Mystring Mystring::substr(unsigned int i, unsigned int j)
{
	Mystring sub;
	sub.len = j - i + 1;
	sub.s = new char[sub.len + 1];

	int k, p;
	for (p = 0, k = i - 1; k < j; k++, p++)
		sub.s[p] = s[k];
	sub.s[sub.len] = '\0';

	puts(sub.s);

	return sub;
}


int main()
{
	Mystring str("jisuanjizhuanye1234ruanjian");
	Mystring substr = str.substr(16, 19);
	str.append(substr.pri());
	str.insert(8, substr.pri());
}
