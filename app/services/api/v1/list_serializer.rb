class Api::V1::ListSerializer
    def initialize(object)
        @list = object
    end

    def to_serialize_json
        @list.to_json(
            include: { 
                tasks: {
                    only: %i[content due_date user_id]
                },
                users: {
                    only: %i[username id]
                }
            },
            except: %i[updated_at]
        )
    end
end