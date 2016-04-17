#define ScrStateMachineInterface
///ScrStateMachineInterface()
   var MachineInterface = ds_map_create();
   MachineInterface[? "@SMI-INTR"] = undefined;
   MachineInterface[? "@SMI-MCHS"] = ds_list_create();
   return MachineInterface;

#define ScrStateMachineValidInterface
///ScrStateMachineValidInterface( interface )
   if (ds_exists(argument[$00], ds_type_map))
      return ds_map_exists(argument[$00], "@SMI-INTR");
   
   return undefined;

#define ScrStateMachineInterfaceDispose
///ScrStateMachineInterfaceDispose( interface )
   var StateMachineInterface = argument[$00],
      StateMachineList = StateMachineInterface[? "@SMI-MCHS"];
   
   for(var i = 0; i < ds_list_size(StateMachineList); i++)
      ds_list_destroy(ds_list_find_value(StateMachineList, i));

   ds_grid_destroy(StateMachineInterface);

#define ScrStateMachine
///ScrStateMachine( interface, state-scr0, state-scr1, state-scr2, ... )
   var StateMachineInterface = argument[$00],
      StateMachine = ds_grid_create($01, $02);
   StateMachine[# $00, STATEMACHINE_CAPTURE] = $00;
   StateMachine[# $00, STATEMACHINE_STATES] = DSLIST();
   
   for(var i = $01; i < argument_count; i++)
      ds_list_add(StateMachine, argument[i]);
   
   ds_list_add(StateMachineInterface[? "SMI-MCHS"], StateMachine);
   return StateMachine;

#define ScrStateMachineInvoke
///ScrStateMachineInvoke( state-machine, params[undefined] )
   var StateMachine = argument[$00],
      StateList = StateMachine[# STATEMACHINE_STATES];
   
   if (argument_count == $01)
      script_execute(StateList[| StateMachine[# STATEMACHINE_CAPTURE]]);
   else
      script_execute(StateList[| StateMachine[# STATEMACHINE_CAPTURE]], argument[$01]);

#define ScrStateMachineDispose
///ScrStateMachineDispose( interface, state-machine )
   var StateMachineInterface = argument[$00], StateMachine = argument[$01];
   ds_list_remove(StateMachineInterface[? "SMI-MCHS"], ds_list_find_index(StateMachineInterface[? "SMI-MCHS"], StateMachine));
   ds_list_destroy(StateMachine[# STATEMACHINE_STATES]);
   ds_grid_destroy(StateMachine);
