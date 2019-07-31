// portpin
int a = 2;
int b = 3;
int c = 4;
int d = 5;
int e = 6;
int f = 7;
int g = 8;
int dp = 9;
int sw0 = 10;
int sw3 = 11;
int st=1;
int out=0;
//  segment   {0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f} 
int segA[16]= {1,0,1,1,0,1,1,1,1,1,1,0,1,0,1,1};
int segB[16]= {1,1,1,1,1,0,0,1,1,1,1,0,0,1,0,0};
int segC[16]= {1,1,0,1,1,1,1,1,1,1,1,1,0,1,0,0};
int segD[16]= {1,0,1,1,0,1,1,0,1,1,0,1,1,1,1,0};
int segE[16]= {1,0,1,0,0,0,1,0,1,0,1,1,1,1,1,1};
int segF[16]= {1,0,0,0,1,1,1,0,1,1,1,1,1,0,1,1};
int segG[16]= {0,0,1,1,1,1,1,0,1,1,1,1,0,1,1,1};
int segT[16]= {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
int i = 0;
void setup() {
  //set pin
  Serial.begin(9600);
  pinMode(a, OUTPUT);
  pinMode(b, OUTPUT);
  pinMode(c, OUTPUT);
  pinMode(d, OUTPUT);
  pinMode(e, OUTPUT);
  pinMode(f, OUTPUT);
  pinMode(g, OUTPUT);
  digitalWrite(dp, 0);
  pinMode(sw0,INPUT_PULLUP);
  pinMode(sw3,INPUT_PULLUP);
  
  
 
}

void loop() {
  
  String tmp = (String)digitalRead(sw0);
  if(digitalRead(sw0)==LOW)st=1;
  if(digitalRead(sw3)==LOW)st=-1;
  Serial.println(tmp);
  out+=st;
  if(out==10)out=0;
  if(out==-1)out=9;
  id(out);
  
  
    
    
  
}
void id(int q){
  
     digitalWrite(a, segA[q]);
     digitalWrite(b, segB[q]);
     digitalWrite(c, segC[q]);
     digitalWrite(d, segD[q]);
     digitalWrite(e, segE[q]);
     digitalWrite(f, segF[q]);
     digitalWrite(g, segG[q]);
     delay(1000);
  
  
  }
