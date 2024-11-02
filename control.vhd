-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- Generated by Quartus II Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition
-- Created on Mon Oct 14 21:01:40 2024

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY control IS
    PORT (
        reset : IN STD_LOGIC := '0';
        clock : IN STD_LOGIC;
        Linea : IN STD_LOGIC := '0';
        Muro : IN STD_LOGIC := '0';
        Hab_sentido : OUT STD_LOGIC;
        Hab_Actual : OUT STD_LOGIC;
        Hab_muro : OUT STD_LOGIC;
        Hab_accion : OUT STD_LOGIC
    );
END control;

ARCHITECTURE BEHAVIOR OF control IS
    TYPE type_fstate IS (Avanza,Actualiza_Posc,Choca,Actual_sent,Decide_Accion);
    SIGNAL fstate : type_fstate;
    SIGNAL reg_fstate : type_fstate;
BEGIN
    PROCESS (clock,reg_fstate)
    BEGIN
        IF (clock='1' AND clock'event) THEN
            fstate <= reg_fstate;
        END IF;
    END PROCESS;

    PROCESS (fstate,reset,Linea,Muro)
    BEGIN
        IF (reset='1') THEN
            reg_fstate <= Avanza;
            Hab_sentido <= '0';
            Hab_Actual <= '0';
            Hab_muro <= '0';
            Hab_accion <= '0';
        ELSE
            Hab_sentido <= '0';
            Hab_Actual <= '0';
            Hab_muro <= '0';
            Hab_accion <= '0';
            CASE fstate IS
                WHEN Avanza =>
                    IF (((Linea = '0') AND (Muro = '0'))) THEN
                        reg_fstate <= Avanza;
                    ELSIF (((Linea = '1') AND (Muro = '0'))) THEN
                        reg_fstate <= Actualiza_Posc;
                    ELSIF ((((Muro = '1') AND (Linea = '0')) OR ((Muro = '1') AND (Linea = '1')))) THEN
                        reg_fstate <= Choca;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= Avanza;
                    END IF;

                    Hab_sentido <= '0';

                    Hab_accion <= '0';

                    Hab_Actual <= '0';

                    Hab_muro <= '0';
                WHEN Actualiza_Posc =>
                    reg_fstate <= Decide_Accion;

                    Hab_sentido <= '0';

                    Hab_accion <= '0';

                    Hab_Actual <= '1';

                    Hab_muro <= '0';
                WHEN Choca =>
                    reg_fstate <= Decide_Accion;

                    Hab_sentido <= '0';

                    Hab_accion <= '0';

                    Hab_Actual <= '0';

                    Hab_muro <= '1';
                WHEN Actual_sent =>
                    IF ((Linea = '0')) THEN
                        reg_fstate <= Avanza;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= Actual_sent;
                    END IF;

                    Hab_sentido <= '1';

                    Hab_accion <= '0';

                    Hab_Actual <= '0';

                    Hab_muro <= '0';
                WHEN Decide_Accion =>
                    reg_fstate <= Actual_sent;

                    Hab_sentido <= '0';

                    Hab_accion <= '1';

                    Hab_Actual <= '0';

                    Hab_muro <= '0';
                WHEN OTHERS => 
                    Hab_sentido <= 'X';
                    Hab_Actual <= 'X';
                    Hab_muro <= 'X';
                    Hab_accion <= 'X';
                    report "Reach undefined state";
            END CASE;
        END IF;
    END PROCESS;
END BEHAVIOR;