package org.mohang.domain;

import java.util.Date; 

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EventVO {
   private String e_num;
   private String o_num;
   private String eh_num;
   private String e_name;
   private Date e_startDate;
   private Date e_endDate;
   private Date e_startRecruiteDate;
   private Date e_endRecruiteDate;
   private String e_type;
   private String e_field;                
   private int e_price;
   private String e_detail;
   private int e_recruitePeople;
   private String e_fname;
   private String e_personName;
   private String e_personPhoneNumber;
   private String e_personEmail;
   private int hitcount;
   private int e_like;
   private String e_dfname;
   private Date e_applyDate;
   
   

}