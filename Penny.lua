Penny = class(coin)

function Penny:init(x,y,a)
    -- you can accept and set parameters here
    self:setup(x,y,a)
    self.value = 1
    self.size = 60
    self.name = "penny"
end