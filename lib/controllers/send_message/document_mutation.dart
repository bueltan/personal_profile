class SendMessageDoc {
  static String sentMsg = """mutation (
                                    \$id_subscription: ID!
                                    \$id: ID
                                    \$id_bubble: String!
                                    \$node4: String
                                    \$node2r: String
                                    \$node3r: String 
                                    \$type: String
                                    \$text:String
                                    \$url: String
                                    \$mime: String 
                                    \$caption: String
                                    \$filename: String
                                    \$vcardList: String
                                    \$payload:String) {
                      CreateMessage(
                        id_subscription:\$id_subscription  
                        id_bubble: \$id_bubble
                        ticket_data: { node4: \$node4
                                       id: \$id
                                       node2r: \$node2r
                                       node3r: \$node3r}

                        message_data: {
                        type: \$type
                        text: \$text
                        url: \$url
                        mime: \$mime
                        caption: \$caption
                        filename: \$filename
                        vcardList: \$vcardList
                        payload: \$payload }
                        ) {
                         ticket {
                          id
                          timestamp
                          last_id_msg
                          node2
                          node3
                          node2r
                          node3r
                          node4
                          emitter_id
                          trace
                          traceback
                          closed_by 
                          }
                         message {
                          id
                          user_sent
                          user_received
                          timestamp
                          }
                      }
                    }
  
  """;
    
}
