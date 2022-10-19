; extends
;From MDeiml/tree-sitter-markdown
; (atx_heading (inline) @text.title)
; (setext_heading (paragraph) @text.title)

[(atx_h1_marker)
 (atx_h2_marker) 
 (atx_h3_marker) 
 (atx_h4_marker) 
 (atx_h5_marker) 
 (atx_h6_marker)] @markdown.marker.h


(link_destination) @markdown.uri

[(list_marker_plus)
 (list_marker_minus)
 (list_marker_star)
 (list_marker_dot)] @markdown.marker.list
 
(thematic_break) @markdown.marker.break
