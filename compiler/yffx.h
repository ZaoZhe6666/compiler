#pragma once

#include<iostream>
#include<fstream>
#include<string>
#include"cffx.h"
#include"metaphysics.h"
#include"table.h"
#include"zjdm.h"
#include"mips.h"
#include"error.h"

#define MAXSTACKNUM 2048

class YF{
	private:
		CF* cf;
		ZJ* zj;
		MIPS* mips;
		std::ofstream outf;
		char ch;
		int line,column,symID;
		int curline;
		int parID;
		std::string token;
		char pairstack[MAXSTACKNUM];
		int pstnum;
		int count;
		int deal_express_type;
		int relate_judge;
		int array_index;
		int array_garbage_judge;
	public:
		YF(std::string filename);
		void getSym();
		void error(int errorID);
		void mustread(int symID);
		void mustread_error(int errorID);
		void p(std::string word);
		void mid2mips();
	  //加法运算符		乘法运算符		关系运算符
		void plus();	void mult();	int relate();
	  //字母			数字			非零数字
		void letter();	void num();		void nznum();
	  //字符			字符串			程序
		int chara();	void strin();	void program();
	  //常量说明		常量定义		无符号整数
		void conexp();	void condef(int type);	int nfint();
	  //整数			标识符			声明头部
		int inty();	void ident();	void prohead();
	  //变量说明		变量定义							类型标识符
		void varexp(int level);	void vardef(int type,int level,int ident);	void typeind();
	  //有返回值函数					无返回值函数	复合语句
		void rfunc(int type,int ident);	void nrfunc(int ident);	void conplex();
	  //参数表					主函数			表达式
		void paratab(int com); void mfunc();	int express(int ident);
	  //项				因子			语句
		void term();	int factor(int ident);	void senten();
	  //赋值语句		条件语句		条件
		void evalue(std::string name);	void condsen();	void condit(int label);
	  //循环语句		常量			情况语句
		void loopsen();	int consty();	void casesen();
	  //情况表			情况子语句		有返回值函数调用语句
		void casetab(int left);	void case3sen();void rfcall(std::string func_name,int para_count,int all_para);
	  //无返回值函数调用 值参数表		语句列
		void nrfcall();	void valpatab();void senlist();
	  //读语句			写语句			返回语句
		void readsen();	void printsen();void retsen();
};