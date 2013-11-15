//
//  Layer1.cpp
//  Game
//
//  Created by 想当当 on 13-11-15.
//
//

#include "Layer1.h"

AA::AA(){}
AA::~AA(){}

AA* AA::createWithName(CCString* _name){
    
    AA* a = new AA();

    if ( a && a->init()){
        a->autorelease();
        return a;
    }
    
    CC_SAFE_DELETE(a);
    return NULL;
    
}

bool AA::init(){
    
    if (!CCLayer::init()){
        return false;
    }
    
}