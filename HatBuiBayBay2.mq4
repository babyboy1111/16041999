//+------------------------------------------------------------------+
//|                                                 HatBuiBayBay.mq4 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
datetime thoigianhientai1;
datetime thoigianhientai2;
datetime thoigianhientai3;
datetime thoigianhientai4;
datetime thoigianhientai5;
datetime thoigianhientai6;
datetime thoigianhientai7;
datetime thoigianhientai8;
datetime thoigianhientai9;
datetime thoigianhientai10;
datetime thoigianhientai11;
datetime thoigianhientai12;
datetime thoigianhientai13;
void OnTick()
  {  
int hour = Hour();
int minute = Minute();  
if( hour >= 13 && minute >= 30 )//&& minute >= 30
{  
  
   //lenh buy_1  
   if (TimeCurrent()> thoigianhientai1 +Period()*43200*12)
   {   
    string sym = Symbol();
    int slip = 3;
    color Arrow = Green;
    string comment = "...";
    int magic = 200;
    int cmd = OP_BUY;
    double price = Ask;   
    double SL = price -2000*Point;
    double volume = 0.05;
    double TP = price + 6000*Point; 
    int newticket = OrderSend (sym,cmd,volume,price,slip,SL,TP,comment,magic,NULL,Arrow);
    thoigianhientai1 = TimeCurrent();
   }
   //profit_1
   if(OrdersTotal()<1)
   {
    int a1 = OrdersHistoryTotal()-1;     
    if(OrderSelect(a1,SELECT_BY_POS,MODE_HISTORY)==true)
    {
     double profit1  = OrderProfit();
     Comment ("profit moi nhat" + (string)profit1);
     
     if(profit1<0)
     {
      //Lenh sell_2
      if (TimeCurrent()> thoigianhientai2 +Period()*43200*12)
      {
       string sym = Symbol();
       int slip = 3;
       color Arrow = Green;
       string comment = "...";
       int magic = 200;
       int cmd = OP_SELL;
       double price = Bid;   
       double SL = price + 2000*Point;
       double volume = 0.07;
       double TP = price - 6000*Point; 
       int newticket = OrderSend (sym,cmd,volume,price,slip,SL,TP,comment,magic,NULL,Arrow);
       thoigianhientai2 = TimeCurrent();
      }
      //profit_2
      if(OrdersTotal()<1)
      {
       int a2 = OrdersHistoryTotal()-1;     
       if(OrderSelect(a2,SELECT_BY_POS,MODE_HISTORY)==true)
       {
        double profit2  = OrderProfit();
        Comment ("profit moi nhat" + (string)profit2);        
        if(profit2<0)
        {
         //Lenh buy_3
         if (TimeCurrent()> thoigianhientai3 +Period()*43200*12)
         {   
          string sym = Symbol();
          int slip = 3;
          color Arrow = Green;
          string comment = "...";
          int magic = 200;
          int cmd = OP_BUY;
          double price = Ask;   
          double SL = price - 2000*Point;
          double volume = 0.1;
          double TP = price + 6000*Point; 
          int newticket = OrderSend (sym,cmd,volume,price,slip,SL,TP,comment,magic,NULL,Arrow);
          thoigianhientai3 = TimeCurrent();         
         }
         //profit3         
         if(OrdersTotal()<1)
         {
          int a3 = OrdersHistoryTotal()-1;     
          if(OrderSelect(a3,SELECT_BY_POS,MODE_HISTORY)==true)
          {
           double profit3  = OrderProfit();
           Comment ("profit moi nhat" + (string)profit3);
           if(profit3<0)
           {
            //Lenh sell_4
            if (TimeCurrent()> thoigianhientai4 +Period()*43200*12)
            {
             string sym = Symbol();
             int slip = 3;
             color Arrow = Green;
             string comment = "...";
             int magic = 200;
             int cmd = OP_SELL;
             double price = Bid;   
             double SL = price + 2000*Point;
             double volume = 0.13;
             double TP = price - 6000*Point; 
             int newticket = OrderSend (sym,cmd,volume,price,slip,SL,TP,comment,magic,NULL,Arrow);
             thoigianhientai4 = TimeCurrent();
            }
            //profit_4
            if(OrdersTotal()<1)
            {
             int a4 = OrdersHistoryTotal()-1;     
             if(OrderSelect(a4,SELECT_BY_POS,MODE_HISTORY)==true)
             {
              double profit4  = OrderProfit();
              Comment ("profit moi nhat" + (string)profit4);
              
              if(profit4<0)
              {
               //Lenh buy_5
               if (TimeCurrent()> thoigianhientai5 +Period()*43200*12)
               {   
                string sym = Symbol();
                int slip = 3;
                color Arrow = Green;
                string comment = "...";
                int magic = 200;
                int cmd = OP_BUY;
                double price = Ask;   
                double SL = price - 2000*Point;
                double volume = 0.17;
                double TP = price + 6000*Point; 
                int newticket = OrderSend (sym,cmd,volume,price,slip,SL,TP,comment,magic,NULL,Arrow);
                thoigianhientai5 = TimeCurrent();         
               }
               //profit3         
               if(OrdersTotal()<1)
               {
                int a5 = OrdersHistoryTotal()-1;     
                if(OrderSelect(a5,SELECT_BY_POS,MODE_HISTORY)==true)
                {
                 double profit5  = OrderProfit();
                 Comment ("profit moi nhat" + (string)profit5);
                 
                 if(profit5<0)
                 {
                  //Lenh sell_6
                  if (TimeCurrent()> thoigianhientai6 +Period()*43200*12)
                  {
                   string sym = Symbol();
                   int slip = 3;
                   color Arrow = Green;
                   string comment = "...";
                   int magic = 200;
                   int cmd = OP_SELL;
                   double price = Bid;   
                   double SL = price + 2000*Point;
                   double volume = 0.23;
                   double TP = price - 6000*Point; 
                   int newticket = OrderSend (sym,cmd,volume,price,slip,SL,TP,comment,magic,NULL,Arrow);
                   thoigianhientai6 = TimeCurrent();
                  }
                  //profit_6
                  if(OrdersTotal()<1)
                  {
                   int a6 = OrdersHistoryTotal()-1;     
                   if(OrderSelect(a6,SELECT_BY_POS,MODE_HISTORY)==true)
                   {
                    double profit6  = OrderProfit();
                    Comment ("profit moi nhat" + (string)profit6);
                    
                    if(profit6<0)
                    {
                     //Lenh buy_7
                     if (TimeCurrent()> thoigianhientai7 +Period()*43200*12)
                     {   
                      string sym = Symbol();
                      int slip = 3;
                      color Arrow = Green;
                      string comment = "...";
                      int magic = 200;
                      int cmd = OP_BUY;
                      double price = Ask;   
                      double SL = price - 2000*Point;
                      double volume = 0.3;
                      double TP = price + 6000*Point; 
                      int newticket = OrderSend (sym,cmd,volume,price,slip,SL,TP,comment,magic,NULL,Arrow);
                      thoigianhientai7 = TimeCurrent();         
                     }
                     //profit_7         
                     if(OrdersTotal()<1)
                     {
                      int a7 = OrdersHistoryTotal()-1;     
                      if(OrderSelect(a7,SELECT_BY_POS,MODE_HISTORY)==true)
                      {
                       double profit7  = OrderProfit();
                       Comment ("profit moi nhat" + (string)profit7);
                       
                       if(profit7<0)
                       {
                        //Lenh sell_8
                        if (TimeCurrent()> thoigianhientai8 +Period()*43200*12)
                        {
                         string sym = Symbol();
                         int slip = 3;
                         color Arrow = Green;
                         string comment = "...";
                         int magic = 200;
                         int cmd = OP_SELL;
                         double price = Bid;   
                         double SL = price + 2000*Point;
                         double volume = 0.41;
                         double TP = price - 6000*Point; 
                         int newticket = OrderSend (sym,cmd,volume,price,slip,SL,TP,comment,magic,NULL,Arrow);
                         thoigianhientai8 = TimeCurrent();
                        }
                        //profit_8
                        if(OrdersTotal()<1)
                        {
                         int a8 = OrdersHistoryTotal()-1;     
                         if(OrderSelect(a8,SELECT_BY_POS,MODE_HISTORY)==true)
                         {
                          double profit8  = OrderProfit();
                          Comment ("profit moi nhat" + (string)profit8);
                          
                          if(profit8<0)
                          {
                           //Lenh buy_9
                           if (TimeCurrent()> thoigianhientai9 +Period()*43200*12)
                           {   
                            string sym = Symbol();
                            int slip = 3;
                            color Arrow = Green;
                            string comment = "...";
                            int magic = 200;
                            int cmd = OP_BUY;
                            double price = Ask;   
                            double SL = price - 2000*Point;
                            double volume = 0.54;
                            double TP = price + 6000*Point; 
                            int newticket = OrderSend (sym,cmd,volume,price,slip,SL,TP,comment,magic,NULL,Arrow);
                            thoigianhientai9 = TimeCurrent();         
                           }
                           //profit_9         
                           if(OrdersTotal()<1)
                           {
                            int a9 = OrdersHistoryTotal()-1;     
                            if(OrderSelect(a9,SELECT_BY_POS,MODE_HISTORY)==true)
                            {
                             double profit9  = OrderProfit();
                             Comment ("profit moi nhat" + (string)profit9);
                             
                             if(profit9<0)
                             {
                              //Lenh sell_10
                              if (TimeCurrent()> thoigianhientai10 +Period()*43200*12)
                              {
                               string sym = Symbol();
                               int slip = 3;
                               color Arrow = Green;
                               string comment = "...";
                               int magic = 200;
                               int cmd = OP_SELL;
                               double price = Bid;   
                               double SL = price + 2000*Point;
                               double volume = 0.72;
                               double TP = price - 6000*Point; 
                               int newticket = OrderSend (sym,cmd,volume,price,slip,SL,TP,comment,magic,NULL,Arrow);
                               thoigianhientai10 = TimeCurrent();
                              }
                              //profit_10
                              if(OrdersTotal()<1)
                              {
                               int a10 = OrdersHistoryTotal()-1;     
                               if(OrderSelect(a10,SELECT_BY_POS,MODE_HISTORY)==true)
                               {
                                double profit10  = OrderProfit();
                                Comment ("profit moi nhat" + (string)profit10);
                                
                                if(profit10<0)
                                {
                                 //Lenh buy_11
                                 if (TimeCurrent()> thoigianhientai11 +Period()*43200*12)
                                 {   
                                  string sym = Symbol();
                                  int slip = 3;
                                  color Arrow = Green;
                                  string comment = "...";
                                  int magic = 200;
                                  int cmd = OP_BUY;
                                  double price = Ask;   
                                  double SL = price - 2000*Point;
                                  double volume = 0.96;
                                  double TP = price + 6000*Point; 
                                  int newticket = OrderSend (sym,cmd,volume,price,slip,SL,TP,comment,magic,NULL,Arrow);
                                  thoigianhientai11 = TimeCurrent();         
                                 }
                                 //profit_11         
                                 if(OrdersTotal()<1)
                                 {
                                  int a11 = OrdersHistoryTotal()-1;     
                                  if(OrderSelect(a11,SELECT_BY_POS,MODE_HISTORY)==true)
                                  {
                                   double profit11  = OrderProfit();
                                   Comment ("profit moi nhat" + (string)profit11);
                                   
                                   if(profit11<0)
                                   {
                                    //Lenh sell_12
                                    if (TimeCurrent()> thoigianhientai12 +Period()*43200*12)
                                    {
                                     string sym = Symbol();
                                     int slip = 3;
                                     color Arrow = Green;
                                     string comment = "...";
                                     int magic = 200;
                                     int cmd = OP_SELL;
                                     double price = Bid;   
                                     double SL = price + 2000*Point;
                                     double volume = 1.28;
                                     double TP = price - 6000*Point; 
                                     int newticket = OrderSend (sym,cmd,volume,price,slip,SL,TP,comment,magic,NULL,Arrow);
                                     thoigianhientai12 = TimeCurrent();
                                    }
                                    //profit_12
                                    if(OrdersTotal()<1)
                                    {
                                     int a12 = OrdersHistoryTotal()-1;     
                                     if(OrderSelect(a12,SELECT_BY_POS,MODE_HISTORY)==true)
                                     {
                                      double profit12  = OrderProfit();
                                      Comment ("profit moi nhat" + (string)profit12);
                                     } 
                                    }  
                                   }   
                                  } 
                                 }  
                                }   
                               } 
                              }  
                             }                             
                            } 
                           }  
                          }   
                         } 
                        }  
                       }   
                      } 
                     }  
                    }   
                   } 
                  }  
                 }    
                }
               }     
              }
             }  
            } 
           }           
          }
         } 
        }
       }                      
      }       
     }
    }
   }
     
}
  }
  
//+------------------------------------------------------------------+
