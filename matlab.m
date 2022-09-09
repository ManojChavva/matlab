clc
%Script File for Mix Design of Concrete Based on IS 10262:2009
description = ['This is a software that performs mix design of  concrete.'];
disp (description);

grade_designation = ['select type of grade designation M20 , M30 , M40'];
disp (grade_designation) %Tell the user
grade_designation = input('Enter grade designation: ', 's' );
maximum_nominal_size_of_aggregate = ['select maximum nominal size of aggregate: 10, 20,40'];
disp (maximum_nominal_size_of_aggregate)
maximum_nominal_size_of_aggregate = input('Enter maximum nominal size of aggregate');
disp(maximum_nominal_size_of_aggregate)
'\n'; 
slump = input('enter the slump value');
fprintf('slump :%3.0f .\n',slump);
'\n'; 
specific_gravity_of_cement = input('enter the specific gravity of cement');
disp(specific_gravity_of_cement)
'\n'; 
specific_gravity_of_water = input('enter the specific gravity of water');
disp(specific_gravity_of_water)
'\n'; 
chemical_admixture = input('enter the admixture') ; 

disp(chemical_admixture)
'\n'; 

specific_gravity_of_admixture = input('enter the specific ADMIXTURE');
disp(specific_gravity_of_admixture)

'\n'; 

specific_gravity_of_coarse_aggregate = input('enter the specific gravity of coarse aggregate');
disp(specific_gravity_of_coarse_aggregate)
'\n';

specific_gravity_of_fine_aggregate = input('enter the specific gravity of fine agggregate');
disp(specific_gravity_of_fine_aggregate)
'\n'; 


description = ['TARGET STRENGTH FOR MIX PROPORTIONIG'];
disp(description)
 %calculation of TARGET STRENGTH %Tell the user
 if grade_designation == 'M20'
     characteristic_compressive_strength_at_28_days= 20;
 elseif grade_designation == 'M30'    
   characteristic_compressive_strength_at_28_days= 30;  
  elseif grade_designation == 'M40'  
    characteristic_compressive_strength_at_28_days= 40;    
 end
 fprintf('characteristic_compressive_strength_at_28_days :%1.0f N/mm2.\n',characteristic_compressive_strength_at_28_days);
 %standard deviation %Tell the user
 if grade_designation == 'M20'
     standard_deviation= 4;
 elseif grade_designation == 'M30'     
     standard_deviation= 5; 
 elseif grade_designation == 'M40'
      standard_deviation= 5;  
 end
 fprintf('standard deviation: %2.0f \n', standard_deviation);
 target_strength = characteristic_compressive_strength_at_28_days + (1.65*standard_deviation);
fprintf('target strength :%3.0f N/mm2.\n',target_strength);
if maximum_nominal_size_of_aggregate==10 
    maximum_water_content =208;
elseif maximum_nominal_size_of_aggregate==20
    maximum_water_content =186;
elseif maximum_nominal_size_of_aggregate==40
    maximum_water_content =165;
end

if slump>=25 & slump<=50
     Maximum_water_content =  maximum_water_content  ;
elseif slump>=50 & slump<=75
     Maximum_water_content =  maximum_water_content + (0.3 *   maximum_water_content)
elseif slump>=75 & slump<=100

    Maximum_water_content =  maximum_water_content + (0.6 *   maximum_water_content)  

elseif slump>=100 & slump<=125
    Maximum_water_content =  maximum_water_content + (0.9*   maximum_water_content)  
end

   fprintf('Maximum water content:%2.2f Kg/m3 \n',Maximum_water_content);
description1 = ['Based on trials with superplasticizer water content reduction of 29 percent has been achieved.'];
description = [' Hence, the arrived water content '];
disp(description1)
disp(description)
water_content = Maximum_water_content*0.71 ;
 x = Maximum_water_content*0.71;
fprintf('water content: %4.0f Kg/m3 \n', water_content);

 water_cement_ratio = 0.40;
 fprintf('water cement ratio: %1.2f \n',water_cement_ratio);
  cement_content= water_content/water_cement_ratio;
fprintf('cement content: %4.0f Kg/m3 \n', cement_content);
description = ['PROPORTION OF VOLUME OF COARSE AGGREGATE AND FINE AGGREGATE CONTENT'];
disp(description)
description2 = ['for zone1'];
disp(description2)
if maximum_nominal_size_of_aggregate == 10 
    volume_of_coarse_aggregate= 0.44 ;

elseif maximum_nominal_size_of_aggregate == 20 
    volume_of_coarse_aggregate= 0.60 ;
 
    elseif maximum_nominal_size_of_aggregate == 40 
    volume_of_coarse_aggregate= 0.69 ;
end
   fprintf('volume of coarse_aggregate: %1.2f \n' ,volume_of_coarse_aggregate);
   volume_of_fine_aggregate = 1 - volume_of_coarse_aggregate ;
   fprintf(' volume of fine aggregate: %1.2f \n' , volume_of_fine_aggregate);
   '\n';
   
   description= ['mix calculations'];
   disp(description)
   '\n';
   
   volume_of_concrete = 1 ;
      fprintf(' volume of concrete: %1.2f m3\n' ,  volume_of_concrete)

   
   volume_of_cement = (cement_content)/(1000 * specific_gravity_of_cement);
   fprintf('volume of cement: %2.6f m3 \n',volume_of_cement)
 
    volume_of_water = x /(1000*specific_gravity_of_water) ;
     fprintf(' volume of water: %1.6f m3 \n' , volume_of_water);
 
      Mass_of_chemical_admixture = 2/(100*cement_content);
      fprintf('mass of chemical admixture: %.5f kg \n', Mass_of_chemical_admixture)
      '\n';
    
      y = Mass_of_chemical_admixture;
       
  volume_of_chemical_admixture = y /(1000*specific_gravity_of_admixture) ; 
  
   fprintf(' volume of admixture: %1.11f m3 \n' , volume_of_chemical_admixture);
   
   
   Volume_of_all_in_aggregate =  volume_of_concrete-(volume_of_cement + volume_of_water +volume_of_chemical_admixture) ;
  
   fprintf('Volume of all in aggregate:%1.3f m3 \n', Volume_of_all_in_aggregate);
   
   Mass_of_coarse_aggregate = volume_of_coarse_aggregate * specific_gravity_of_coarse_aggregate * 1000 ;
  
 
   fprintf('Mass of coarse aggregate:%1.4f m3 \n', Mass_of_coarse_aggregate); 
     Mass_of_fine_aggregate = volume_of_fine_aggregate * specific_gravity_of_fine_aggregate * 1000 ;
   fprintf('Mass of fine aggregate:%1.4f m3 \n', Mass_of_fine_aggregate);    
