package com.study.controller;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Stack;

// RestController = @Controller @ResponseBody
@RestController
public class UserController {

    @GetMapping("/getUser")
    public  String sayHello(String name) {
        Stack<String>stk=new Stack<>();
        name=name.replace(" ","");
        List<String>list=getStr(name);
        int i=0;
        while(i<list.size()){
            if(!stk.empty()&&(i+1)<list.size()&&list.get(i).equals("x")||list.get(i).equals("/")||list.get(i).equals("%")){
                if(!stk.empty()&&(i+1)<list.size()) {
                    if(list.get(i).equals("x")){
                        double sum=Double.parseDouble(stk.pop())*Double.parseDouble(list.get(i+1));
                        stk.push(String.valueOf(sum));
                        i=i+2;
                    }

                    else if(list.get(i).equals("%")){
                        int sum=Integer.parseInt(stk.pop())%Integer.parseInt(list.get(i+1));
                        stk.push(String.valueOf(sum));
                        i=i+2;
                    }
                    else if(list.get(i).equals("/")){
                        double sum=Double.parseDouble(stk.pop())/Double.parseDouble(list.get(i+1));
                        stk.push(String.valueOf(sum));
                        i=i+2;
                    }

                }}
            else{
                stk.push(list.get(i++));

            }
        }
        int j=0;
        double sum2=0;
        while(j<stk.size()){
            if(j+1<stk.size()&&stk.get(j).equals("+")){
                sum2+=  Double.parseDouble(stk.get(j+1));
                j=j+2;
            }
            else if(j+1<stk.size()&&stk.get(j).equals("-")){
                sum2-=  Double.parseDouble(stk.get(j+1));
                j=j+2;
            }
            else{
                sum2+=Double.parseDouble(stk.get(j++));
            }
        }
        return String.valueOf(sum2);
    }
    public  List<String> getStr(String a){
        StringBuffer sb=new StringBuffer();
        List<String> list=new ArrayList<>();
        char[]b=a.toCharArray();
        for(char i:b){
            if(Character.isDigit(i)||i=='.'){

                sb.append(i);
            }
            else{
                list.add(sb.toString());
                sb.setLength(0);
                sb.append(i);
                list.add(sb.toString());
                sb.setLength(0);
            }
        }
        list.add(sb.toString());

        return list;

    }

}
