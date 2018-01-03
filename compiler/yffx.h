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
	  //�ӷ������		�˷������		��ϵ�����
		void plus();	void mult();	int relate();
	  //��ĸ			����			��������
		void letter();	void num();		void nznum();
	  //�ַ�			�ַ���			����
		int chara();	void strin();	void program();
	  //����˵��		��������		�޷�������
		void conexp();	void condef(int type);	int nfint();
	  //����			��ʶ��			����ͷ��
		int inty();	void ident();	void prohead();
	  //����˵��		��������							���ͱ�ʶ��
		void varexp(int level);	void vardef(int type,int level,int ident);	void typeind();
	  //�з���ֵ����					�޷���ֵ����	�������
		void rfunc(int type,int ident);	void nrfunc(int ident);	void conplex();
	  //������					������			���ʽ
		void paratab(int com); void mfunc();	int express(int ident);
	  //��				����			���
		void term();	int factor(int ident);	void senten();
	  //��ֵ���		�������		����
		void evalue(std::string name);	void condsen();	void condit(int label);
	  //ѭ�����		����			������
		void loopsen();	int consty();	void casesen();
	  //�����			��������		�з���ֵ�����������
		void casetab(int left);	void case3sen();void rfcall(std::string func_name,int para_count,int all_para);
	  //�޷���ֵ�������� ֵ������		�����
		void nrfcall();	void valpatab();void senlist();
	  //�����			д���			�������
		void readsen();	void printsen();void retsen();
};