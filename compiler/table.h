#pragma once

#include<iostream>
#include<fstream>
#include<stack>
#include<string>
#include"metaphysics.h"
#include"error.h"

#define MAXSIZE 2048


struct Func{
	std::string name;
	std::string para;
};

struct FuncTable{
	Func func[MAXSIZE];
	int top;
};

class FT{
	private:
		std::ofstream outf;
		FuncTable *s;
	public:
		FT();
		//��ջ����
		int ft_push(std::string name,std::string para);
		void ft_add(std::string para);
		//��ѯ����
		int ft_seek(std::string name,std::string para);
		int ft_size();
};

struct Symbol{
	std::string name;
	int level;
	/*	
		0	����
		1	����
		2	��������
		3	�����ڶ������
	*/
	int type;
	/*  
		0	void func	�޷���ֵ����
		1	int func	����int����
		2	char func	����char����
		3	const int	int����
		4	const char	char����
		5	int			int����
		6	char		char����
		7	int[]		int����
		8	char[]		char����
	*/
	int value;
};

struct SymTable{
	Symbol symbol[MAXSIZE];
	int top;
};

class ST{
	private:
		std::ofstream outf;
		SymTable *s;
	public:
		ST();
		//����ջ����
		int st_push(std::string name,int level,int type,int value);
		void st_pop(int level);
		//��ѯ����
		int st_seek(std::string name);
		int st_size();
		void st_change(int value);
};