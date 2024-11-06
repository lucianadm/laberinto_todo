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
-- Created on Wed Nov 06 19:17:54 2024

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY control_motor IS
    PORT (
        reset : IN STD_LOGIC := '0';
        clk : IN STD_LOGIC;
        A : IN STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
        fin : IN STD_LOGIC := '0';
        D : IN STD_LOGIC := '0';
        I : IN STD_LOGIC := '0';
        Llego : IN STD_LOGIC := '0';
        MD : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
        MI : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
        H : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
    );
END control_motor;

ARCHITECTURE BEHAVIOR OF control_motor IS
    TYPE type_fstate IS (Derecho,Gira_Der_90,Gira_Der_180,Gira_Izq_90,Izq_Cerca,Der_Cerca,GANO);
    SIGNAL fstate : type_fstate;
    SIGNAL reg_fstate : type_fstate;
BEGIN
    PROCESS (clk,reg_fstate)
    BEGIN
        IF (clk='1' AND clk'event) THEN
            fstate <= reg_fstate;
        END IF;
    END PROCESS;

    PROCESS (fstate,reset,A,fin,D,I,Llego)
    BEGIN
        IF (reset='1') THEN
            reg_fstate <= Derecho;
            MD <= "00";
            MI <= "00";
            H <= "00";
        ELSE
            MD <= "01";
            MI <= "01";
            H <= "00";
            CASE fstate IS
                WHEN Derecho =>
                    IF (((((A(1 DOWNTO 0) = "11") AND (D = '0')) AND (I = '0')) AND (Llego = '0'))) THEN
                        reg_fstate <= Derecho;
                    ELSIF (((((A(1 DOWNTO 0) = "10") AND (D = '0')) AND (I = '0')) AND (Llego = '0'))) THEN
                        reg_fstate <= Gira_Der_90;
                    ELSIF (((((A(1 DOWNTO 0) = "01") AND (D = '0')) AND (I = '0')) AND (Llego = '0'))) THEN
                        reg_fstate <= Gira_Der_180;
                    ELSIF (((((A(1 DOWNTO 0) = "00") AND (D = '0')) AND (I = '0')) AND (Llego = '0'))) THEN
                        reg_fstate <= Gira_Izq_90;
                    ELSIF ((((I = '1') AND (D = '0')) AND (Llego = '0'))) THEN
                        reg_fstate <= Izq_Cerca;
                    ELSIF (((D = '1') AND (Llego = '0'))) THEN
                        reg_fstate <= Der_Cerca;
                    ELSIF ((Llego = '1')) THEN
                        reg_fstate <= GANO;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= Derecho;
                    END IF;

                    MD <= "01";

                    MI <= "01";

                    H <= "00";
                WHEN Gira_Der_90 =>
                    IF ((fin = '0')) THEN
                        reg_fstate <= Gira_Der_90;
                    ELSIF ((fin = '1')) THEN
                        reg_fstate <= Derecho;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= Gira_Der_90;
                    END IF;

                    MD <= "10";

                    MI <= "01";

                    H <= "10";
                WHEN Gira_Der_180 =>
                    IF ((fin = '0')) THEN
                        reg_fstate <= Gira_Der_180;
                    ELSIF ((fin = '1')) THEN
                        reg_fstate <= Derecho;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= Gira_Der_180;
                    END IF;

                    MD <= "10";

                    MI <= "01";

                    H <= "01";
                WHEN Gira_Izq_90 =>
                    IF ((fin = '0')) THEN
                        reg_fstate <= Gira_Izq_90;
                    ELSIF ((fin = '1')) THEN
                        reg_fstate <= Derecho;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= Gira_Izq_90;
                    END IF;

                    MD <= "01";

                    MI <= "10";

                    H <= "10";
                WHEN Izq_Cerca =>
                    IF ((I = '1')) THEN
                        reg_fstate <= Izq_Cerca;
                    ELSIF ((I = '0')) THEN
                        reg_fstate <= Derecho;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= Izq_Cerca;
                    END IF;

                    MD <= "10";

                    MI <= "01";

                    H <= "00";
                WHEN Der_Cerca =>
                    IF ((D = '0')) THEN
                        reg_fstate <= Derecho;
                    ELSIF ((D = '1')) THEN
                        reg_fstate <= Der_Cerca;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= Der_Cerca;
                    END IF;

                    MD <= "01";

                    MI <= "10";

                    H <= "00";
                WHEN GANO =>
                    reg_fstate <= GANO;

                    MD <= "00";

                    MI <= "00";

                    H <= "00";
                WHEN OTHERS => 
                    MD <= "XX";
                    MI <= "XX";
                    H <= "XX";
                    report "Reach undefined state";
            END CASE;
        END IF;
    END PROCESS;
END BEHAVIOR;
