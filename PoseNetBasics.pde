// import Runway library
import com.runwayml.*;
// reference to runway instance
RunwayHTTP runway;

import processing.video.*;

Capture video;

void captureEvent(Capture video){
  video.read();
}

JSONObject data;

void setup(){
  // match sketch size to default model camera setup
  size(600,400);
  // setup Runway
  runway = new RunwayHTTP(this);
  
  video = new Capture(this, 600, 400);
  video.start();
  

}


void draw(){
  //pushMatrix();
  //scale(-1,1);
  //image(cam, -cam.width, 0 );
  //popMatrix();
  
  image(video,0,0);
  
  //background(255,255,255);
  // use the utiliy class to draw PoseNet parts
  //ModelUtils.drawPoseParts(data,g,10);
  draw_poses();
  
  
}

// this is called when new Runway data is available
void runwayDataEvent(JSONObject runwayData){
  // point the sketch data to the Runway incoming data 
  data = runwayData;
}

void draw_poses(){
  if(data != null){
    JSONArray poses = data.getJSONArray("poses");
    print(poses);
    
    for (int i = 0; i < poses.size(); i ++){
    //  //poses[i] ::pose.getJSONArray(i)
      JSONArray the_pose = poses.getJSONArray(i);
    //  for (int j = 0; j < the_pose.size(); j++){
    //    JSONArray point = the_pose.getJSONArray(j);
        
    //    float x = point.getFloat(0)*width;
    //    float y = point.getFloat(1)*height;
        
    //    fill(255);
    //    ellipse(x,y,15,15);
        
    //    if(j==0){
    //      fill(255,0,0);
    //      ellipse(x,y,40,40);
    //    }
    //  }
      
      
      ////left wrist
      //JSONArray point = the_pose.getJSONArray(9);
      //float x = point.getFloat(0)*width;
      //float y = point.getFloat(1)*height;
      //fill(255,0,0);
      //noStroke();
      //ellipse(x,y,40,40);
      
      ////right wrist
      //JSONArray point1 = the_pose.getJSONArray(10);
      //float x1 = point1.getFloat(0)*width;
      //float y1 = point1.getFloat(1)*height;
      //fill(0,255,0);
      //noStroke();
      //ellipse(x1,y1,40,40);
      
      //left eye
      JSONArray point = the_pose.getJSONArray(1);
      float x = point.getFloat(0)*width;
      float y = point.getFloat(1)*height;
      fill(155, 208, 235);
      noStroke();
      ellipse(x,y,30,30);
      fill(0);
      ellipse(x,y,9,18);
      fill(255,255,255);
      ellipse(x-5,y-5,5,5);
      
      //right eye
      JSONArray point1 = the_pose.getJSONArray(2);
      float x1 = point1.getFloat(0)*width;
      float y1 = point1.getFloat(1)*height;
      fill(155, 208, 235);
      noStroke();
      ellipse(x1,y1,30,30);
      fill(0);
      ellipse(x1,y1,9,18);
      fill(255,255,255);
      ellipse(x1-5,y1-5,5,5);
      
      //nose
      JSONArray point2 = the_pose.getJSONArray(0);
      float x2 = point2.getFloat(0)*width;
      float y2 = point2.getFloat(1)*height;
      fill(242, 191, 225);
      noStroke();
      triangle(x2-28,y2-20, x2,y2+10, x2+28,y2-20);
      
      //wiskers
      JSONArray point3 = the_pose.getJSONArray(0);
      float x3 = point3.getFloat(0)*width;
      float y3 = point3.getFloat(1)*height;
      stroke(255,255,255);
      strokeWeight(5);
      line(x3+30, y3, x3+70, y3+20);
      line(x3-30, y3, x3-70, y3+20);
      line(x3+30, y3, x3+50, y3+35);
      line(x3-30, y3, x3-50, y3+35);
      line(x3+30, y3, x3+70, y3-5);
      line(x3-30, y3, x3-70, y3-5);
      
      //ear right
      JSONArray point4 = the_pose.getJSONArray(1);
      float x4 = point4.getFloat(0)*width;
      float y4 = point4.getFloat(1)*height;
      fill(242, 191, 225);
      stroke(252, 186,3);
      strokeWeight(7);
      triangle(x4-30,y4-75, x4,y1-130, x4+30,y4-75);
      
      //ear left
      JSONArray point5 = the_pose.getJSONArray(2);
      float x5 = point5.getFloat(0)*width;
      float y5 = point5.getFloat(1)*height;
      fill(242, 191, 225);
      stroke(252, 186,3);
      strokeWeight(7);
      triangle(x5-30,y5-75, x5,y1-130, x5+30,y5-75);
      
    }
  }
}


//void keyPressed(){
//  //print(data);
//  draw_poses();
 
//}
