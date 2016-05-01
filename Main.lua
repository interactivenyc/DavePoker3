displayMode(FULLSCREEN)
supportedOrientations(PORTRAIT)

function setup()
    rectMode(CENTER)
    w1,h1=230,250
    w2,h2=650,360
    w3,h3=530,775
    w4,h4=120,660
    pt=pot()
    tab={}
    table.insert(tab,Penny(w1,h1,0))
    table.insert(tab,Nickel(w1+100,h1,0))
    table.insert(tab,Dime(w1+200,h1,0))
    table.insert(tab,Quarter(w1+300,h1,0))

    table.insert(tab,Penny(w2,h2,90))
    table.insert(tab,Nickel(w2,h2+100,90))
    table.insert(tab,Dime(w2,h2+200,90))
    table.insert(tab,Quarter(w2,h2+300,90))

    table.insert(tab,Penny(w3,h3,180))
    table.insert(tab,Nickel(w3-100,h3,180))
    table.insert(tab,Dime(w3-200,h3,180))
    table.insert(tab,Quarter(w3-300,h3,180))

    table.insert(tab,Penny(w4,h4,270))
    table.insert(tab,Nickel(w4,h4-100,270)) 
    table.insert(tab,Dime(w4,h4-200,270))
    table.insert(tab,Quarter(w4,h4-300,270))    
end

function draw()
    background(40, 40, 50)
    pushMatrix()
    translate(WIDTH/2,HEIGHT/2)
    rotate(0)
    pushStyle()
    tint(235, 148, 69, 255)
    sprite("Documents:poker background 2",0,0,1024,1024)
    popStyle()
    popMatrix()
    
    pt:draw()
    for a,b in pairs(tab) do
        b:draw()
    end
    
end

function touched(t)
    for a,b in pairs(tab) do
        b:touched(t)
    end  
    pt:touched(t)
end


