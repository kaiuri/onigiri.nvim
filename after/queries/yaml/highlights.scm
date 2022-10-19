; extends
; (block_mapping_pair
;   key: (flow_node [(double_quote_scalar) (single_quote_scalar)] @yaml.field))
; (block_mapping_pair
;   key: (flow_node (plain_scalar (string_scalar) @yaml.field)))
;
; (flow_mapping
;   (_ key: (flow_node [(double_quote_scalar) (single_quote_scalar)] @yaml.field)))
; (flow_mapping
;   (_ key: (flow_node (plain_scalar (string_scalar) @yaml.field))))

["'" "\""]@string.delimiter


["&"] @operator

(alias ["*"] @keyword)


["---"] @keyword

(block_sequence_item ["-"] @operator)
