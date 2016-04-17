###A collection of scripts for creating basic script-invokable state-machines.

--
#####ScrStateMachineInterface()
Creates a ds-map to act as a basic container for tracking existing state-machines. The ds-map key `"@SMI-INTR"` is a placeholder key to help define this ds-map as a state-machine interface. The ds-map key `"@SMI-MCHS"` holds a ds-list of existing state-machines.

#####ScrStateMachine(interface, state-scr0, state-scr1, state-scr2, ...)
Creates a ds-grid with width-1 and heihgt-2 as a state-machine with the various states as scripts to be called for each state. The index `0,1` is the current state and the index `0,2` is the list of ordered states. The current state should match the index of the state script in the ds-list.

#####ScrStateMachineInvoke(state-machine, params[undefined])
Invokes the script associates with the current state of the state-machine with the params passed as arguments. If the params are not passed as arguments the params are undefined.

#####ScrStateMachineValidInterface(interface)
An interface is valid if it is a ds-map and contains the key `"@SMI-INTR"`. This script returns whether or not the interface passed is a valid interface.

#####ScrStateMachineDispose(state-machine)
Frees the state-machine from memory.

#####ScrStateMachineInterfaceDispose(interface)
Frees the state-machine interface from memory.
