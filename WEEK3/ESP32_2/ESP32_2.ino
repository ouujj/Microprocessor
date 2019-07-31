int a = 13;
int b = 12;
int c = 14;
int d = 27;
int e = 26;
int f = 25;
int g = 33;
int t = 32;
int sw0 = 35;
int sw3 = 34;
int st=1;

//  segment   {0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f} 
int segA[16]= {1,0,1,1,0,1,1,1,1,1,1,0,1,0,1,1};
int segB[16]= {1,1,1,1,1,0,0,1,1,1,1,0,0,1,0,0};
int segC[16]= {1,1,0,1,1,1,1,1,1,1,1,1,0,1,0,0};
int segD[16]= {1,0,1,1,0,1,1,0,1,1,0,1,1,1,1,0};
int segE[16]= {1,0,1,0,0,0,1,0,1,0,1,1,1,1,1,1};
int segF[16]= {1,0,0,0,1,1,1,0,1,1,1,1,1,0,1,1};
int segG[16]= {0,0,1,1,1,1,1,0,1,1,1,1,0,1,1,1};
int segT[16]= {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
int Bt0 = 22, Bt1 = 23;
int State = 0;
int x=0;

void setup() {
 
  pinMode(Bt0, INPUT_PULLUP);
  pinMode(Bt1, INPUT_PULLUP);
   pinMode(a, OUTPUT);
  pinMode(b, OUTPUT);
  pinMode(c, OUTPUT);
  pinMode(d, OUTPUT);
  pinMode(e, OUTPUT);
  pinMode(f, OUTPUT);
  pinMode(g, OUTPUT);
  pinMode(t, OUTPUT);
  digitalWrite(t, 0);
  Serial.begin(9600);
}

void loop() {
  
  x+=State;
  if(x == -1)x=9;
  if(x== 10)x=0;
  id(x);

 
}
void id(int q){
  
     digitalWrite(a, segA[q]);
     digitalWrite(b, segB[q]);
     digitalWrite(c, segC[q]);
     digitalWrite(d, segD[q]);
     digitalWrite(e, segE[q]);
     digitalWrite(f, segF[q]);
     digitalWrite(g, segG[q]);
     if (digitalRead(Bt0) == LOW) State = -1;
  if (digitalRead(Bt1) == LOW) State *= -1;
  Serial.println(digitalRead(Bt1));
     delay(1000);
  
  
  
  }
