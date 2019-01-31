



int Isodd(int n)
{
  if(n%2==0)
  return 1;
  else return 2;

}

int Isprime(int n)
{
    if(n==2 || n==3)
    return 3;
    int t=2;
     
     
    while(n>3)
    {
        
       if(n%t==0)
       break;
        
       if(t==n/2)
       {
         return 3;
         break;
       }
         
         t++;
     }

}


int main()
{
   int result,newresult,check=0;
   int n;
   
    
    result=Isodd(n);
     
      if(Isprime(n)==3)
       result=3;
   
  
                     switch(result)
                     {
                       case 1: newresult=n+1;
                               break;
                     
                       case 2: while(1)
                               {
                               
                                  int a,b;
                                  a=n,b=n;
                               
                                  while(1)
                                  {
                                      a++;
                                      if(Isprime(a)==3);
                                      {
                                           newresult=a;
                                           check=1;
                                           break;
                                      }
                                        if(check==1)
                                        break;
                                  }
                               
                               
                                  while(1)
                                  {
                                    b--;
                                    if(Isprime(b)==3)
                                    {
                                       newresult=b;
                                       check=1;
                                       break;
                                    }
                                        if(check==1)
                                        break;
                                  }
                               
                                   if(check==1)
                                   break;
                               
                               }
                       
                       
                       case 3: newresult=n+1;
                               break;
                     }
  
  


   

}
