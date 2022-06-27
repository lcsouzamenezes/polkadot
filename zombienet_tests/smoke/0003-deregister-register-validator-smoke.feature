Description: Deregister / Register Validator Smoke
Network: ./0003-deregister-register-validator-smoke.toml
Creds: config

alice: is up
bob: is up
charlie: is up
dave: is up

# ensure is in the validator set
dave: reports polkadot_node_is_active_validator is 1 within 240 secs

# deregister and check
alice: js-script ./0003-deregister-register-validator.js with "deregister,dave" return is 0 within 30 secs

# Wait 2 sessions. The authority set change is enacted at curent_session + 2.
sleep 120 seconds
dave: reports polkadot_node_is_active_validator is 0 within 180 secs

# register and check
alice: js-script ./0003-deregister-register-validator.js with "register,dave" return is 0 within 30 secs
sleep 120 seconds
dave: reports polkadot_node_is_active_validator is 1 within 180 secs