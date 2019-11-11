class Api::V1::ListSerializer
    def initialize(object)
        @list = object
    end

    def to_serialize_json
        @list.to_json(
            include: { 
                tasks: {
                    only: %i[user_id content due_date completed]
                },
                users: {
                    only: %i[id username]
                }
            },
            except: %i[updated_at]
        )
    end
end