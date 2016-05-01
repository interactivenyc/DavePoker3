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
    table.insert(tab,coin(w1,h1,"penny",0,1))
    table.insert(tab,coin(w1+100,h1,"nickel",0,5))
    table.insert(tab,coin(w1+200,h1,"dime",0,10))
    table.insert(tab,coin(w1+300,h1,"quarter",0,25))

    table.insert(tab,coin(w2,h2,"penny",90,1))
    table.insert(tab,coin(w2,h2+100,"nickel",90,5))
    table.insert(tab,coin(w2,h2+200,"dime",90,10))
    table.insert(tab,coin(w2,h2+300,"quarter",90,25))

    table.insert(tab,coin(w3,h3,"penny",180,1))
    table.insert(tab,coin(w3-100,h3,"nickel",180,5))
    table.insert(tab,coin(w3-200,h3,"dime",180,10))
    table.insert(tab,coin(w3-300,h3,"quarter",180,25))

    table.insert(tab,coin(w4,h4,"penny",270,1))
    table.insert(tab,coin(w4,h4-100,"nickel",270,5)) 
    table.insert(tab,coin(w4,h4-200,"dime",270,10))
    table.insert(tab,coin(w4,h4-300,"quarter",270,25))    
end

function draw()
    background(40, 40, 50)
    fill(0,255,0)
    rect(WIDTH/2,HEIGHT/2,450,450)
    for a,b in pairs(tab) do
        b:draw()
    end
    pt:draw()
end

function touched(t)
    for a,b in pairs(tab) do
        b:touched(t)
    end  
    pt:touched(t)
end


