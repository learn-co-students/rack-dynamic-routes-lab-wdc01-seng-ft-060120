class Application

    @@items = [Item.new("cheese", 2.99), Item.new("cookies", 4.50)]
    

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            add_item = req.path.split("/items/").last
            if item = @@items.find {|it| it.name == add_item}
                resp.write item.price
            else 
                resp.status = 400
                resp.write "Item not found"
                end 
            else 
                resp.status = 404
                resp.write  "Route not found"
        end
        resp.finish
    end

    # if req.path!=="/items"
    #     resp.write "Route not found"
    #     resp.status = 404


end
