[@@@js.stop]

type html_elt = Js_of_ocaml.Dom_html.element Js_of_ocaml.Js.t

[@@@js.start]

[@@@js.implem type html_elt = Js_of_ocaml.Dom_html.element Js_of_ocaml.Js.t]

[@@@js.implem let html_elt_to_js = Obj.magic]

[@@@js.implem let html_elt_of_js = Obj.magic]

module MutationRecord : sig
  type t (*a `MutationRecord` item*)

  val type_ : t -> string [@@js.get "type"]

  val target : t -> html_elt [@@js.get]

  val added_nodes : t -> html_elt list [@@js.get "added_nodes"]

  val removed_nodes : t -> html_elt list [@@js.get "removed_nodes"]

  val previous_sibling : t -> html_elt [@@js.get "previousSibling"]

  val next_sibling : t -> html_elt [@@js.get "nextSibling"]

  val attribute_name : t -> string [@@js.get "attributeName"]

  val attribute_namespace : t -> string [@@js.get "attributeNamespace"]

  val old_value : t -> string [@@js.get "oldValue"]
end

type obs

val new_ : callback:(MutationRecord.t array -> obs -> unit) -> obs
  [@@js.new "MutationObserver"]

type options

val options :
  ?childList:bool ->
  ?attributes:bool ->
  ?characterData:bool ->
  ?subtree:bool ->
  ?attributeOldValue:bool ->
  ?characterDataOldValue:bool ->
  ?attributeFilter:bool ->
  unit ->
  options
  [@@js.builder] [@@js.verbatim_names]

val observe : obs -> html_elt -> opts:options -> unit [@@js.call]
