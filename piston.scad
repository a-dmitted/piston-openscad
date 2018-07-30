
module piston(piston_r, piston_way, stab_width, hole_r, nozzle_len, nozzle_hole_r){
  cyl_r = piston_r*1.2;
  side_width = piston_r*0.2;
  difference(){
    union(){  
      cylinder(h=piston_way + stab_width
        , r=cyl_r
        , center = false
      );
      
      translate([0,0,stab_width/2])
      rotate([0,-90,0])
      cylinder(h=cyl_r+nozzle_len
        , r=nozzle_hole_r+2
        , center = false
      );   
    }
    translate([0,0,stab_width])
    cylinder(h=piston_way+1, r=piston_r, center = false);
    
    translate([0,0,side_width])  
    cylinder(h=stab_width+side_width+2, r=hole_r, center = false); 

    translate([0,0,stab_width/2])
    rotate([0,-90,0])
    cylinder(h=cyl_r+nozzle_len+1
      , r=nozzle_hole_r
      , center = false
    );     
  }
}

difference(){
piston(piston_r = 10
    , piston_way = 100
    , stab_width = 20
    , hole_r = 8
    , nozzle_len=10
    , nozzle_hole_r = 2
    );
translate([0,0,-1])
cube([18,18,150]);  
}

