{ lib, ... }:
{
  # Flatten 2-deep nested attrmap to one where attr keys are zipped together with the passed function.
  flat2With = f: xs: builtins.listToAttrs (lib.flatten (lib.mapAttrsToList (ns: attrs: lib.mapAttrsToList (checkName: value: { name = f ns checkName; inherit value; }) attrs) xs));
}
