#pragma once

#include<iostream>
#include<fstream>
#include<stack>
#include<string>
#include<vector>
#include"metaphysics.h"
#include"error.h"

#define MAXSIZE 1024

struct PCode{
	int num1;
	int num2;
	int num3;
	std::string str;
};

struct DagPoint{
	std::string name;
	//节点指向的左右节点，若无则为0
	int left;
	int right;
	//节点的父节点个数
	int fatnum;
	//节点的值
	int value;
	//节点对应的序号
	int loc;
	//节点是否为中间节点 0-中间节点 1-最终节点
	int fin_or_temp;
};

struct DagTable{
	std::vector<DagPoint> dt;
	int topnum;
};

struct DagRelate{
	std::string relate;
	int left;
	int right;
	int mid;
};

struct DagRelateTable{
	std::vector<DagRelate> drt;
};

class DT{
	private:
		std::ofstream outf;
		DagTable *s1;
		DagRelateTable *s2;
	public:
		DT();
		//判断变量是否在dag表中
		int dt_seek(std::string str);
		//判断寄存器是否在dag表中
		int DT::dt_seek(std::string str,int n);
		//判断常数int/char是否在dag表中
		int dt_seek(int n);
		//判断关系left relate right是否在关系树中
		int dt_seek(std::string relate,int left,int right);

		//创建新的DAG图中孤立节点
		int dt_create_point(std::string name,int value);
		//修改dag表中寄存器指向位置
		void dt_change_point_value(int point_index, int loc);
		//创建DAG图中关系节点
		int dt_create_relate(std::string relate,int left,int right);
		void dt_delete_relate();
};

struct Func{
	std::string name;
	int para;
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
		//入栈操作
		int ft_push(std::string name,int para);
		void ft_add(int para);
		//查询查找
		int ft_para(std::string name);
		int ft_last_para();
		int ft_conf(std::string name);
		int ft_size();
};

struct Symbol{
	std::string name;
	int level;
	/*	
		0	常量
		1	函数
		2	函数参数
		3	函数内定义变量
	*/
	int type;
	/*  
		0	void func	无返回值函数
		1	int func	返回int函数
		2	char func	返回char函数
		3	const int	int常量
		4	const char	char常量
		5	int			int变量
		6	char		char变量
		7	int[]		int数组
		8	char[]		char数组
		9	temp		中间变量
	*/
	int value;
	int location;
};

struct SymTable{
	Symbol symbol[MAXSIZE];
	int top;
};

class ST{
	private:
		std::ofstream outf;
		SymTable *s;
		int const_sp;
		int const_judge;
	public:
		ST();
		//出入栈操作
		int st_push(std::string name,int level,int type,int value);
		void st_pop(int level);
		//查询操作
		int st_seek(std::string name,int push_or_pop);
		int st_size();
		int st_loc(int weight);
		int st_weight();
		void st_change(int value);
		int get_loc(std::string func_name,std::string sym_name,int value);
		int getpara_offset(std::string name);
		int st_func_type(std::string name);
		int array_length(std::string name);
};
