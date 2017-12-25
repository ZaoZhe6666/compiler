#include<iostream>
#include<fstream>
#include<string>
#include<cstdlib>
#include<cstring>
#include<cctype>
#include"yffx.h"
#include"error.h"

using namespace std;

extern FT ft;
extern ST st;

YF::YF(string filename){
	cf = new CF(filename);
	zj = new ZJ();
	mips = new MIPS();
	outf.open("out_yf.txt");
	ch=' ';
	line=1;
	curline = 1;
	symID=0;
	parID=0;
	column=1;
	token="";
	pairstack[0] = '\0';
	pstnum = 0;
	count = 0;
	deal_express_type = 1;
}

void YF::getSym(){
	curline = line;
	if(cf->getSymID() != -1){
		token = cf->getSym();
		symID = cf->getSymID();
		while(symID < 0 && symID != -1){
			token = cf->getSym();
			symID = cf->getSymID();
		}
	}
	line = cf->getline();
	column = cf->getcolumn();
}

void YF::p(std::string word){
	outf << "This is a " << word << endl;
}

void YF::error(int errorID){
	extern Error error;
	error.PrintError(errorID,curline,column);
}

void YF::mustread(int sym){
	if(symID == -1){
		return;
	}
	while(symID != sym && line == curline){
		error(-100);
		cout << "Need #"<< sym << "   Have #" << symID <<endl;
		getSym();
	}
	if(symID == sym){
		getSym();
	}
	else{
		error(-101);
		cout<< "Need #"<< sym << endl;
	}
}

void YF::mid2mips(){
	int i;
	for(i=0;i<=zj->ptop;i++){
		mips->mid2mips(zj->getcode(i));
	}
}




/*
void YF::case3sen(){
	p("Son of Case Sentense");
	if(symID == -1){
		return;
	}
	consty();
}*/

void YF::casesen(){
	p("Case Sentense");
	if(symID == -1){
		return;
	}
	mustread(LPARENTSY);
	int left = express(0);
	mustread(RPARENTSY);
	mustread(LBRACESY);
	casetab(left);
	mustread(RBRACESY);
}

void YF::casetab(int left){
	p("Table of Case");
	if(symID == -1){
		return;
	}
	if(symID == CASESY){
		getSym();
//		case3sen();
		int casenum = consty();
		if(casenum < 0){
			error(-55);
		}
		else{
			int label = ++zj->label_num;
			zj->midcode("case",left,casenum,label);
			st.st_push("T",left,9,1);
			mustread(COLONSY);
			senten();
			zj->midcode("label",0,0,label);
		}
		casetab(left);
	}
}

int YF::chara(){
	p("Charactor");
	if(symID == -1){
		return 0;
	}
	if(symID != SQUTASY){
		return 0;
	}
	return 1;
}

void YF::condef(int type = 0){
	p("Const Definition");
	if(symID == -1){
		return;
	}
	if(symID == INTSY || type == 1){
		getSym();
		if(symID == IDENTSY){
			std::string const_name;
			const_name = token;
			getSym();
			mustread(ASSIGNSY);
			int num = inty();
			if(num!=0){
				num *= std::stoi(token);
				if(!st.st_push(const_name,0,3,num)){
					error(-300);
				}
				else{	
					zj->midcode("const",0,num,const_name);

				}
			}
			getSym();
			if(symID == COMMASY){
				condef(1);
			}
			else if(symID == SEMISY){
			}
			else{
				error(-88);
			}
		}
		else{
			error(-57);
		}
	}
	else if(symID == CHARSY || type == 2){
		getSym();
		if(symID == IDENTSY){
			std::string const_name = token;
			getSym();
			if(symID == ASSIGNSY){
				getSym();
				if(!chara()){
					error(-93);
				}
				else{
					if(!st.st_push(const_name,0,4,token[0])){
						error(-307);
					}
					else{
						zj->midcode("const",1,token[0],const_name);
					}
				}
				getSym();
				if(symID == COMMASY){
					condef(2);
				}
				else if(symID == SEMISY){
				}
				else{
					error(-87);
				}
			}
			else if(symID == COMMASY){
				condef(2);
			}
			else if(symID == SEMISY){
			}
			else{
				error(-58);
			}
		}
		else{
			error(-59);
		}
	}
}

void YF::condit(int label){
	p("Condition");
	if(symID == -1){
		return;
	}
	int cond = express(0);
	if(label<0){
		label*=-1;
		zj->midcode("jmp",cond,-1,label);
	}
	else{
		zj->midcode("jmp",cond,1,label);
	}
}

void YF::condsen(){
	p("Condition Sentense");
	if(symID == -1){
		return;
	}
	int label = ++zj->label_num;
	mustread(LPARENTSY);
	condit(label);
	mustread(RPARENTSY);
	senten();
	zj->midcode("label",0,0,label);
}

void YF::conexp(){
	p("Const Expression");
	if(symID == -1){
		return;
	}
	getSym();
	condef();
	mustread(SEMISY);
}

void YF::conplex(){
	p("Conplex Sentense");
	if(symID == -1){
		return;
	}
	while(symID == CONSTSY){
		conexp();
	}
	varexp(3);
	senlist();
}

int YF::consty(){
	p("Const");
	int r_v = -1;;
	if(symID == -1){
		return -1;
	}
	if(symID == SQUTASY){
		r_v = token[0];
		getSym();
	}
	else if(symID == PLUSSY || symID == SUBSY){
		int symbol = (symID == PLUSSY)?1:-1;
		getSym();
		if(symID == NUMBERSY){
			r_v = symbol*std::stoi(token);
			getSym();
		}
		else{
			r_v = (symbol == 1)?'+':'-';
		}
	}
	else if(symID == NUMBERSY){
		r_v = std::stoi(token);
		getSym();
	}
	else{
		error(-99);
	}
	return r_v;
}

void YF::evalue(std::string name){
	p("Assign Sentense");
	if(symID == -1){
		return;
	}
	int left = express(0);
	count+=2;
	st.st_push("T",count,9,1);
	zj->midcode("=",count,0,0);
	zj->midcode("=",count,1,left);
	mustread(RBRACKSY);
	mustread(ASSIGNSY);
	int right = express(0);
	zj->midcode("[]=",count,right,name);
	count -=2;
}

int YF::express(int ident = 0){
	p("Express");
//	cout<<"express"<<endl;
	if(symID == -1){
	 	return -1;
	}
	int left = count;
	int right=0;
	int symbol = 1;
	if(ident == 0){
		left = ++count;
		zj->midcode("=",left,0,0);
		st.st_push("T",left,9,1);
	}
	if(symID == PLUSSY || symID == SUBSY){
		if(ident != 0){
			deal_express_type = 0;
		}
		if(ident > 1){
			error(-41);
		}
		if(symID == SUBSY){
			symbol = 2;
		}
		getSym();
		if(symID == PLUSSY || symID == SUBSY){
			if(symID == SUBSY){
				symbol = 3-symbol;
			}
			getSym();
		}
	}
	else if(relate()){
		deal_express_type = 0;
		std::string symb = token;
		getSym();
		right = express();
		zj->midcode(symb,left,zj->label_num+1,right);
		st.st_push("T",left,9,1);
	}

	if(symID == IDENTSY || symID == NUMBERSY || symID ==SQUTASY
		|| symID == MULTSY || symID == DIVSY || relate() || symID == LPARENTSY){
		right = factor(0);
		zj->midcode("=",left,symbol,right);
		st.st_push("T",left,9,1);
		st.st_push("T",right,9,1);
		count--;
		right = express(1);
	}
	if(ident == 0){
		count--;
	}
	return left;
}

int YF::factor(int ident = 0){
	int det = deal_express_type;
	p("Factor");
//	cout << "factor"<<endl;
	if(symID == -1){
		return -1;
	}
	int left =count;
	int right = 0;
	int symbol = 3;
	if(ident == 0){
		left = ++count;
		zj->midcode("=",left,0,1);
		st.st_push("T",left,9,1);
	}

	if(symID == PLUSSY || symID == SUBSY){
		if(ident == 0){
			error(-43);
		}
		return left;
	}
	else if(relate()){
		if(ident == 0){
			error(-47);
		}
		return left;
	}
	else if(symID == MULTSY || symID == DIVSY){
		deal_express_type = 0;
		if(ident == 0){
			error(-44);
		}
		if(symID == DIVSY){
			symbol = 4;
		}
		getSym();
		ident = 0;
	}

	if(symID == IDENTSY){
		std::string ident_name = token;
		if(ident != 0){
			error(-42);
		}
		getSym();
		if(symID == LPARENTSY){
			deal_express_type = 0;
			int ident_type = ft.ft_conf(ident_name);
			int func_type = st.st_func_type(ident_name);
			int para_num = 0;
			if(!ident_type){
				cout << "error 302 : ident is " << ident_type << endl;
				error(-302);
			}
			else{
				para_num = ft.ft_para(ident_name);
			}
			getSym();
//			cout << "3	T" << left << symbol << " = calling function " << ident_name <<endl;
			rfcall(ident_name,1,para_num);
			zj->midcode("=()",left,symbol,ident_name);
			st.st_push("T",left,9,1);
			if(func_type == 3){
				deal_express_type = det;
			}
			factor(1);
			return left;
		}
		else if(symID == LBRACKSY){
			int ident_type = st.st_seek(ident_name,0);
			if(ident_type <8 || ident_type >9){
				cout << "error 304 : ident do not shuzu  "<< ident_type << endl;
				error(-304);
			}
			if(ident_type == 8){
				deal_express_type = 0;
			}
			getSym();
			int offset = express();
			if(symbol == 4){
				offset += 1;
				offset *= -1;
			}
			zj->midcode("=[]",left,offset,ident_name);
			st.st_push("T",left,9,1);
			st.st_push("T",offset,9,1);
//			cout << "3	T" << left << symbol << " = " << ident_name << "[ T" << offset << " ]" <<endl;
			mustread(RBRACKSY);
			if(ident_type == 9){
				deal_express_type = det;
			}
			factor(1);
			return left;
		}
		else{
			int ident_type = st.st_seek(ident_name,0);
			if(ident_type <4 || ident_type >7){
				cout << "error 306 : ident do not init  "<< ident_type << endl;
				error(-306);
			}
			if(ident_type == 4 || ident_type == 6){
				deal_express_type = 0;
			}
			zj->midcode("=",left,symbol,ident_name);
			st.st_push("T",left,9,1);
			factor(1);
			return left;
		}
	}
	else if(symID == NUMBERSY){
		deal_express_type = 0;
		int num_v = std::stoi(token);
		zj->midcode("=",left,-1*symbol,num_v);
		st.st_push("T",left,9,1);
		if(ident != 0){
			error(-45);
		}
		getSym();
		factor(1);
//		cout << "4	T" << left << symbol << "=" << " T" << right <<endl;
		return left;
	}
	else if(symID == SQUTASY){
		int char_num = token[0];
		zj->midcode("=",left,-1*symbol,char_num);
		st.st_push("T",left,9,1);
		if(ident != 0){
			error(-42);
		}
		getSym();
		factor(1);
		return left;
	}
	else if(symID == LPARENTSY){
		deal_express_type = 0;
		if(ident != 0){
			error(-42);
		}
		getSym();
		right = express();
		zj->midcode("=",left,symbol,right);
		st.st_push("T",left,9,1);
		st.st_push("T",right,9,1);
		mustread(RPARENTSY);
		factor(1);
		return left;
	}
	else if(symID == RPARENTSY || symID == RBRACKSY){
		return left;
	}
	else if(symID == SEMISY || symID == COMMASY){
		return left;
	}
	else{
		error(-666);
		return left;
	}
}

int YF::inty(){
	p("Int Number");
	if(symID == -1){
		return 0;
	}
	if(symID == PLUSSY || symID == SUBSY){
		int sym = (symID == SUBSY)?-1:1;
		getSym();
		if(symID == NUMBERSY){
			return sym;
		}
		else{
			error(-61);
		}
	}
	else if(symID == NUMBERSY){
		return 1;
	}
	else{
		error(-62);
	}
	return 0;
}

void YF::letter(){
	p("Letter");
	if(symID == -1){
		return;
	}
	getSym();
}

void YF::loopsen(){
	p("Loop Sentense");
	if(symID == -1){
		return;
	}
	int label = ++zj->label_num;
	zj->midcode("label",0,0,label);
	senten();
	mustread(WHILESY);
	mustread(LPARENTSY);
	condit(-1*label);
	mustread(RPARENTSY);
}

void YF::mfunc(){
	p("Main Function");
	mips->main_judge = 1;
	if(symID == -1){
		return;
	}
	getSym();
	mustread(LPARENTSY);
	mustread(RPARENTSY);
	mustread(LBRACESY);
	conplex();
	mustread(RBRACESY);
	zj->midcode("endfunc",0,-1,0);
}

void YF::mult(){
	p("Mult");
	if(symID == -1){
		return;
	}
	getSym();
	if(symID != PLUSSY && symID != SUBSY){
		error(-63);
	}
}

void YF::num(){
	p("Number");
	if(symID == -1){
		return;
	}
	getSym();
	if(symID != NUMBERSY){
		error(-64);
	}
}

int YF::nfint(){
	p("No Symbol Int Number");
	if(symID == -1){
		return 0;
	}
	if(symID == NUMBERSY){
		if(token.c_str()[0] == 0 && token.length()>1){
			error(-15);
		}
		else{
			return 1;
		}
	}
	return 0;
}

void YF::nrfunc(int ident = 0){
	p("No Return Value Function");
	if(symID == -1){
		return;
	}
	if(ident == 0){
		getSym();
		if(symID == IDENTSY){
			ft.ft_push(token,0);
			st.st_push(token,1,0,0);
			zj->midcode("func",0,0,token);
			getSym();
			if(symID ==LPARENTSY){
				pairstack[pstnum++] = '(';
			}
			else{
				error(-77);
			}
		}
		else if(symID == MAINSY){
			zj->midcode("func",0,0,token);
			ft.ft_push(token,0);
			st.st_push(token,1,0,0);
			mfunc();
			return;
		}
		else{
			error(-86);
		}
	}
	else{
		getSym();
		if(symID == LPARENTSY){
			pairstack[pstnum++] = '(';
		}
		else{
			error(-27);
		}
	}
	paratab(0);
	getSym();
	mustread(LBRACESY);
	pairstack[pstnum++] = '{';
	conplex();
	mustread(RBRACESY);
	pairstack[--pstnum] = '\0';
	zj->midcode("endfunc",0,0,1);
}

void YF::nznum(){
	p("Number Without Zero");
	if(symID == -1){
		return;
	}
	getSym();
	if(symID != NUMBERSY){
		error(-65);
	}
	else if(int(token.c_str())==0){
		error(-66);
	}
}

void YF::paratab(int com = 0){
	p("Parameter Table");
	if(symID == -1){
		return;
	}
	getSym();
	if(symID == RPARENTSY){
		if(com == 1){
			error(-24);
		}
		pairstack[--pstnum] = '\0';
	}
	else if(symID == INTSY || symID == CHARSY){
		int sym_type = (symID == INTSY)?5:6;
		if(com == 2){
			error(-26);
		}
		getSym();
		if(symID == IDENTSY){
			if(st.st_seek(token,1)){
				error(-301);
			}
			else{
				ft.ft_add(1);
				st.st_push(token,2,sym_type,0);
				int para_num = ft.ft_last_para();
				zj->midcode("paraneed",para_num,0,token);
			}
			paratab(2);
		}
	}
	else if(symID == COMMASY){
		paratab(1);
	}
	else{
		error(-25);
	}
}

void YF::plus(){
	p("Plus Symbol");
	if(symID == -1){
		return;
	}
	getSym();
	if(symID != PLUSSY || symID != SUBSY){
		error(-67);
	}
}

void YF::printsen(){
	p("Print Sentense");
	if(symID == -1){
		return;
	}
	mustread(LPARENTSY);
	if(symID == STRINGSY){
		int str_num = mips->string_save(token);
		std::string string_tok = token;
		getSym();
		if(symID == COMMASY){
			getSym();
			deal_express_type = 1;
			int p_num = express();
			zj->midcode("pr",0,str_num,string_tok);
			zj->midcode("pr",1,deal_express_type,p_num);
			deal_express_type = 1;
			mustread(RPARENTSY);
		}
		else{
			zj->midcode("pr",0,str_num,string_tok);
			zj->midcode("pr",1,0,"");
			if(symID == RPARENTSY){
				getSym();
			}
			else{
				error(-45);
			}
		}
	}
	else{
		deal_express_type = 1;
		int p_num = express();
//		cout << p_num << endl;
		zj->midcode("pr",0,deal_express_type,p_num);
		deal_express_type = 1;
		mustread(RPARENTSY);
	}
}

void YF::program(){
	p("Programme");
	if(symID == -1){
		return;
	}
	getSym();
	while(symID == CONSTSY){
		conexp();
	}
	varexp(0);
	while(symID != -1){
		if(symID == CHARSY || symID == INTSY){
			rfunc(symID,0);
//			st.st_pop(1);
		}
		else if(symID == VOIDSY){
			nrfunc();
//			st.st_pop(1);
		}
		else{
			getSym();
			error(-65);
		}
	}
	mid2mips();
}

void YF::readsen(){
	p("ReadIn Sentense");
	if(symID == -1){
		return;
	}
	mustread(LPARENTSY);
	if(symID == IDENTSY){
		int vtype = st.st_seek(token,0);
		if(vtype == 6){
			zj->midcode("sc",0,1,token);
		}
		else if(vtype == 7){
			zj->midcode("sc",0,0,token);
		}
		else{
			error(-79);
		}
	}
	mustread(IDENTSY);
	while(symID == COMMASY){
		getSym();
		if(symID == IDENTSY){
			int ident_type = st.st_seek(token,0);
			if(ident_type <6 || ident_type>7){
				error(-303);
			}
			else{
				if(ident_type == 6){
					zj->midcode("sc",0,1,token);
				}
				else{
					zj->midcode("sc",0,0,token);
				}
			}
			getSym();
		}
		else{
			error(-43);
		}
	}
	if(symID == RPARENTSY){
		getSym();
	}
	else{
		error(-44);
	}
}

int YF::relate(){
	p("Relate Judge");
	if(symID == -1){
		return 0;
	}
	if(symID != GREATSY && symID !=	LESSSY &&
	   symID != GESY	&& symID !=	LESY &&
	   symID != EQUALSY && symID != NESY){
		return 0;
	}
	return 1;
}

void YF::retsen(){
	p("Return Sentense");
	if(symID == -1){
		return;
	}
	if(symID == LPARENTSY){
		getSym();
		int r_j = express();
		zj->midcode("ret",0,r_j,1);
		mustread(RPARENTSY);
	}
	else{
		zj->midcode("ret",0,0,-1);
	}
}

void YF::rfcall(std::string func_name,int para_count,int all_para){
	if(all_para == 0){
		mustread(RPARENTSY);
		zj->midcode("()",0,0,func_name);
		return;
	}
	p("Call Function Have Return Value");
	if(symID == -1){
		return;
	}
	if(para_count > all_para){
		error(-600);
		return;
	}
	int para;
	para = express();
	zj->midcode("para",para,para_count,func_name);
	st.st_push("T",para,9,1);
//	cout << "Parameter T" << para<<endl;
	if(symID == COMMASY){
		getSym();
		rfcall(func_name,para_count+1,all_para);
	}
	else{
		if(para_count < all_para){
			error(-601);
		}
		else{
			zj->midcode("()",0,0,func_name);
		}
		mustread(RPARENTSY);
	}
}

void YF::rfunc(int type,int ident = 0){
	p("Function Have Return Value");
	if(symID == -1){
		return;
	}
	if(ident == 0){
		getSym();
		if(symID == IDENTSY){
			ft.ft_push(token,0);
			int func_type = (type==INTSY)?1:2;
			st.st_push(token,1,func_type,0);
			zj->midcode("func",0,0,token);
			getSym();
			if(symID == LPARENTSY){
				pairstack[pstnum++] = '(';
			}
			else{
				error(-22);
			}
		}
		else if(symID == MAINSY){
			error(-20);
			ft.ft_push(token,0);
			st.st_push(token,1,0,0);
			zj->midcode("func",0,0,token);
			mfunc();
			return;
		}
		else{
			error(-21);
		}
	}
	paratab();
	getSym();
	mustread(LBRACESY);
	pairstack[pstnum++] = '{';
	conplex();
	mustread(RBRACESY);
	pairstack[--pstnum] = '\0';
	zj->midcode("endfunc",0,0,-1);
}

void YF::senlist(){
	p("Sentenses List");
	if(symID == -1){
		return;
	}
	if(symID == RBRACESY){
		return;
	}
	else{
		senten();
		senlist();
	}
}

void YF::senten(){
	p("Sentense");
	if(symID == -1){
		return;
	}
	if(symID == IFSY){
		getSym();
		condsen();
	}
	else if(symID == DOSY){
		getSym();
		loopsen();
	}
	else if(symID == SWITCHSY){
		getSym();
		casesen();
	}
	else if(symID == LBRACESY){
		getSym();
		senlist();
		mustread(RBRACESY);
	}
	else if(symID == SCANFSY){
		getSym();
		readsen();
		mustread(SEMISY);
	}
	else if(symID == PRINTFSY){
		getSym();
		printsen();
		mustread(SEMISY);
	}
	else if(symID == RETURNSY){
		getSym();
		retsen();
		mustread(SEMISY);
	}
	else if(symID == SEMISY){
		getSym();
	}
	else if(symID == IDENTSY){
		std::string ident_name = token;
		int ident_type = st.st_seek(token,0);
		getSym();
		if(symID == LPARENTSY){
			int para_num = 0;
			if(!ft.ft_conf(ident_name)){
				cout << "error 306 : "<< ident_type <<endl;
				error(-306);
			}
			else{
				para_num = ft.ft_para(ident_name);
			}
			getSym();
			rfcall(ident_name,1,para_num);
			mustread(SEMISY);
		}
		else if(symID == ASSIGNSY){
			if(ident_type <6 || ident_type>7){
				cout << "error 305 ident is not var : " << ident_type << endl;
				error(-305);
			}
			getSym();
			int value = express();
			zj->midcode("=",value,-1,ident_name);
			st.st_push("T",value,9,1);
			mustread(SEMISY);
		}
		else if(symID == LBRACKSY){
			if(ident_type < 8 || ident_type >9){
				error(-306);
			}
			getSym();
			evalue(ident_name);
		}
		else{
			error(-96);
		}
	}
	else if(symID == -1){
		
	}
	else{
		error(-40);
		getSym();
	}
}

void YF::strin(){
	p("String");
	if(symID == -1){
		return;
	}
	getSym(); 
	if(symID != STRINGSY){
		error(-69);
	}
}

void YF::term(){
	p("Term");
	if(symID == -1){
		return;
	}
	factor();
}

void YF::vardef(int type,int level,int ident = 0){
	p("Variable Definition");
	if(symID == -1){
		return;
	}
	if(symID == COMMASY){
		getSym();
		if(symID == IDENTSY){
			int var_type = (type == INTSY)?5:6;
			std::string var_name = token;
			st.st_push(var_name,level,var_type,0);
			getSym();
			if(symID == LBRACKSY){
				getSym();
				if(nfint()){
					int num = std::stoi(token);
					st.st_change(num);
					zj->midcode("[]",var_type,num,var_name);
				}
				else{
					error(-9);
				}
				getSym();
				if(symID == RBRACKSY){
					getSym();
				}
				else{
					error(-16);
				}
				vardef(type,level,1);
			}
			else{			
				zj->midcode("var",var_type,level,var_name);
				vardef(type,level,1);
			}
		}
		else{
			error(-10);
		}
	}
	else if(symID == SEMISY){
		getSym();
		varexp(level);
	}
	else{
		error(-14);
	}
}

void YF::varexp(int level){
	p("Variable Expression");
	if(symID == -1){
		return;
	}
	if(symID == INTSY || symID == CHARSY){
		int type = symID;
		getSym();
		if(symID == IDENTSY){
			std::string var_name = token;
			getSym();
			if(symID == LPARENTSY){
				pairstack[pstnum++] = '(';
				ft.ft_push(var_name,0);
				zj->midcode("func",0,0,var_name);
				int func_type = (type==INTSY)?1:2;
				st.st_push(var_name,1,func_type,0);
				rfunc(type,1);
//				st.st_pop(1);
			}		
			else if(symID == LBRACKSY){
				getSym();
				if(nfint()){
					int num = std::stoi(token);
					int var_type = (type == INTSY)?7:8;
					st.st_push(var_name,level,var_type,num);
					zj->midcode("[]",var_type,num,var_name);
				}
				else{
					error(-9);
				}
				getSym();
				if(symID == RBRACKSY){
					getSym();
				}
				else{
					error(-16);
				}
				vardef(type,level,1);
			}
			else{
				int var_type = (type == INTSY)?5:6;
				if(st.st_push(var_name,level,var_type,0)){
					zj->midcode("var",var_type,0,var_name);
				}
				vardef(type,level,0);
			}
		}
		else{
			error(-17);
		}
	}
	else if(symID == VOIDSY){
		getSym();
		if(symID == IDENTSY){
			ft.ft_push(token,0);
			if(st.st_push(token,1,0,0)){
				zj->midcode("func",0,0,token);
			}
			nrfunc(1);
//			st.st_pop(1);
		}
		else if(symID == MAINSY){
			ft.ft_push(token,0);
			if(st.st_push(token,1,0,0)){
				zj->midcode("func",0,0,token);
			}
			mfunc();
			return;
//			st.st_pop(1);
		}
		else{
			error(-19);
		}
	}
	else{
	}
}