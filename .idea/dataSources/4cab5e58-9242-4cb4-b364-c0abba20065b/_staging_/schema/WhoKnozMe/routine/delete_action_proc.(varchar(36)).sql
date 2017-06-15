CREATE PROCEDURE WhoKnozMe.delete_action_proc(IN `$action_id` VARCHAR(36))
  BEGIN
    DECLARE $action_type_id VARCHAR(36);
    SET $action_type_id = (SELECT action_type
                           FROM action_tbl
                           WHERE id = $action_id);
    IF $action_type_id = '0a198d1c-fc4c-11e3-92fe-52540002e01a'
    THEN
      DELETE FROM transaction_tbl
      WHERE action_id = $action_id;
    END IF;
    IF $action_type_id = '0a19cafc-fc4c-11e3-92fe-52540002e01a'
    THEN
      DELETE FROM observation_tbl
      WHERE action_id = $action_id;
    END IF;
    IF $action_type_id = '4cd85fa3-0787-11e4-8260-5254000a52fa'
    THEN
      DELETE FROM procedure_tbl
      WHERE action_id = $action_id;
    END IF;
    IF $action_type_id = '5752e91a-facc-11e3-bdbb-52540002e01a'
    THEN
      DELETE FROM supply_tbl
      WHERE action_id = $action_id;
    END IF;
    IF $action_type_id = '5b2a4b46-facc-11e3-bdbb-52540002e01a'
    THEN
      DELETE FROM diagnosis_tbl
      WHERE action_id = $action_id;
    END IF;
    IF $action_type_id = '80ae1671-e1d6-11e3-b09f-5254000a52fa'
    THEN
      DELETE FROM encounter_tbl
      WHERE action_id = $action_id;
    END IF;
    DELETE FROM value_triplet_tbl
    WHERE business_object_id = $action_id;
    DELETE FROM action_tbl
    WHERE id = $action_id;
  END;
