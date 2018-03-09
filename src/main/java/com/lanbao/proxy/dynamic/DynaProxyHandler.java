package com.lanbao.proxy.dynamic;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

public class DynaProxyHandler implements InvocationHandler{
	
	private Object target;
	
	DynaProxyHandler(Object target){
		super();
		this.target = target;
	}

	@Override
	public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
		// TODO Auto-generated method stub
		System.out.println("我打开电脑");
		method.invoke(target, args);
		System.out.println("我关闭电脑");
		return null;
	}

}
