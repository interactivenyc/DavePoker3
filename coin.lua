coin=class()

function coin:init(x,y,n,a,v)
    self.x=x
    self.y=y
    self.deltaX=x
    self.deltaY=y
    self.count=10
    self.name=n    -- name
    self.angle=a    -- rotate angle
    self.value=v    -- coin values
    self.rem=false
    self.sub=1
end

function coin:draw()    
    pushMatrix()
    fill(255)
    translate(self.x,self.y)
    rotate(self.angle)
    stroke(0, 124, 255, 255)
    strokeWidth(2)
    --ellipse(0,0,80)
    sprite("Project:"..self.name,0,0,80)
    fill(255,0,0)
    text(self.name,0,0)
    popMatrix()

    pushMatrix()
    translate(self.deltaX,self.deltaY)
    rotate(self.angle)
    fill(255)
    sprite("Project:"..self.name,0,0,80)
    --ellipse(0,0,80)
    fill(255,0,0)
    text(self.name,0,0)
    text(self.count,0,-60)
    text(self.value*self.count,0,-80)
    popMatrix()
end

function coin:touched(t)
    if t.x>self.deltaX-40 and t.x<self.deltaX+40 and 
            t.y>self.deltaY-40 and t.y<self.deltaY+40 and self.count>0 then
        if t.state==BEGAN then
            self.id=t.id
        end
    end
    if t.state==MOVING and self.id==t.id then
        self.x=t.x
        self.y=t.y
    end
    if t.state==ENDED and self.id==t.id then
        self.id=0
        if self.count>0 then
            self.count=self.count-1
        end
        table.insert(pt.coins,{x=self.x,y=self.y,name=self.name,angle=self.angle,value=self.value})
        self.x=self.deltaX
        self.y=self.deltaY
    end
end