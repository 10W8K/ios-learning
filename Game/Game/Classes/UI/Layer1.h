//
//  Layer1.h
//  Game
//
//  Created by 想当当 on 13-11-15.
//
//

#ifndef __Game__Layer1__
#define __Game__Layer1__

#include <iostream>
#include "cocos2d.h"

USING_NS_CC;

class AA :public CCLayer {
    
public:
    
    AA();
    
    ~AA();
    
    
    virtual bool init();
    

    //CREATE_FUNC( AA );
    static AA* createWithName(CCString* _name);

};


#endif /* defined(__Game__Layer1__) */
