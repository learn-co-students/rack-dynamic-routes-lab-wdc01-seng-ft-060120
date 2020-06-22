class Application

    #Why are manually instanciated here?
    @@items = [Item.new("Apples",5.23), Item.new("Oranges",2.43)]
    
    #what is env
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
                #req.path.split what does that mean
            item_name = req.path.split("/items/").last
                # ask Prof. why line 12 we are setting to var
               if item = @@items.find {|ite_ms| ite_ms.name == item_name}
                    resp.write item.price
                else
                    resp.status = 400
                    resp.write "Item not found"
                end
        else
            resp.status = 404
            resp.write "Route not found"
        end
        resp.finish
    end

end