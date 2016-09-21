# NDK-Apk-So-2016-09-21
1-前言
==================
引用地址：
### -- HTTP: https://github.com/han1202012/NDKHelloworld.git 
### -- SSH : git@github.com:han1202012/NDKHelloworld.git
作用：NDK 开发JNI的流程，生成SO库 ，Android应用调用So库 
	
2-实验目的：
=============
在Android源码中，编译Android应用，编译生成so动态库
3-开发工具：
=============
Notepad++
Android源码 SDK

4-工程目录：
=============
	NDKHelloworld	
		|  Android.mk
		│  AndroidManifest.xml
		├─jni
		│      Android.mk
		│      hello.c
		├─res
		└─src
			└─shuliang
				└─han
					└─ndkhelloworld
						MainActivity.java
5-编译与运行结果：
==============
	编译步骤
	----1---在trunk目录下执行 . build/envsetup.sh;     
		trunk$ . build/envsetup.sh;//声明环境变量
	----2---在trunk目录下执行  lunch pp_XX-user
		trunk$ lunch pp_XX-user //选择产品
	----3--- mm -B  
		NDKHelloworld$ mm -B	//编译应用，编译动态库
		Processing target/product/pp_XX-user/obj/APPS/ndkhello_intermediates/package.apk
		Done!
		Install: out/target/product/pp_XX-user/system/app/ndkhello.odex
		Install: out/target/product/pp_XX-user/system/lib/libhello.so  //<--生成的动态库
		Install: out/target/product/pp_XX-user/system/app/ndkhello.apk //<--生成的APK应用
		
	将动态库添加到Android应用中
	----1---取出生成的so库文件
		out/target/product/pp_XX-user/system/lib/libhello.so //<--生成的动态库
	----2---通过cmd窗口，进入模拟器的根文件系统
			
		C:\Users\glu>adb shell //进入Android模拟器shell
		root@generic:/ # mount -o remount /system // 重新挂载/system目录，使之能读写：
		mount -o remount /system
		root@generic:/ # chmod 777 /system //修改这个文件的权限
		chmod 777 /system
		root@generic:/ # ^C  //Ctrl + c 退出Android模拟器shell
		C:\Users\glu>adb push C:\Users\glu\Desktop\libhello.so /system/lib  //将so文件，拷贝到/system/bin目录下
			29 KB/s (5176 bytes in 0.171s) //<--出现这样的打印信息，说明动态库添加成功
	----3--启动需要调用动态库的APP
		---通过CMD窗口启动模拟器的步骤
			C:\Users\glu>android list avd //列出模拟器
			C:\Users\glu> emulator @avd1  //启动模拟器
			C:\Users\glu>adb install C:\Users\glu\Desktop\ndkhello.apk //安装APK应用
