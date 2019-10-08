package com.neuedu.util;

import java.util.UUID;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

public class UUIDUtil {
    private  UUIDUtil(){}
    public  static  String getUUID(){
        UUID uuid = UUID.randomUUID();
        return uuid.toString();

    }
}
