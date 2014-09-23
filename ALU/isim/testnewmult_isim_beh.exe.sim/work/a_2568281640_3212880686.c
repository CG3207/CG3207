/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/jw/Dropbox/EE4/CG3207/LAB/LAB2_joey/newmult.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_2568281640_3212880686_p_0(char *t0)
{
    char t18[16];
    char t22[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    int t12;
    int t13;
    int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    int t23;
    unsigned int t24;
    char *t25;
    char *t26;
    char *t27;
    unsigned int t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;

LAB0:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 1312U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3592);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(51, ng0);
    t3 = (t0 + 1512U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(67, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t3 = t1;
    memset(t3, (unsigned char)2, 32U);
    t4 = (t0 + 3736);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 32U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(68, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t3 = t1;
    memset(t3, (unsigned char)2, 32U);
    t4 = (t0 + 3800);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 32U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(69, ng0);
    t1 = (t0 + 1192U);
    t3 = *((char **)t1);
    t1 = (t0 + 3672);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t3, 32U);
    xsi_driver_first_trans_delta(t1, 33U, 32U, 0LL);

LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(52, ng0);
    t3 = (t0 + 1192U);
    t7 = *((char **)t3);
    t3 = (t0 + 3672);
    t8 = (t3 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t7, 32U);
    xsi_driver_first_trans_delta(t3, 33U, 32U, 0LL);
    xsi_set_current_line(54, ng0);
    t1 = (t0 + 6103);
    *((int *)t1) = 1;
    t3 = (t0 + 6107);
    *((int *)t3) = 32;
    t12 = 1;
    t13 = 32;

LAB8:    if (t12 <= t13)
        goto LAB9;

LAB11:    xsi_set_current_line(64, ng0);
    t1 = (t0 + 1992U);
    t3 = *((char **)t1);
    t15 = (64 - 31);
    t16 = (t15 * 1U);
    t17 = (0 + t16);
    t1 = (t3 + t17);
    t4 = (t0 + 3736);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 32U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(65, ng0);
    t1 = (t0 + 1992U);
    t3 = *((char **)t1);
    t15 = (64 - 63);
    t16 = (t15 * 1U);
    t17 = (0 + t16);
    t1 = (t3 + t17);
    t4 = (t0 + 3800);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 32U);
    xsi_driver_first_trans_fast_port(t4);
    goto LAB6;

LAB9:    xsi_set_current_line(56, ng0);
    t4 = (t0 + 1992U);
    t7 = *((char **)t4);
    t14 = (0 - 64);
    t15 = (t14 * -1);
    t16 = (1U * t15);
    t17 = (0 + t16);
    t4 = (t7 + t17);
    t2 = *((unsigned char *)t4);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB12;

LAB14:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 1992U);
    t3 = *((char **)t1);
    t15 = (64 - 64);
    t16 = (t15 * 1U);
    t17 = (0 + t16);
    t1 = (t3 + t17);
    t4 = (t0 + 3672);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 64U);
    xsi_driver_first_trans_delta(t4, 1U, 64U, 0LL);

LAB13:
LAB10:    t1 = (t0 + 6103);
    t12 = *((int *)t1);
    t3 = (t0 + 6107);
    t13 = *((int *)t3);
    if (t12 == t13)
        goto LAB11;

LAB17:    t14 = (t12 + 1);
    t12 = t14;
    t4 = (t0 + 6103);
    *((int *)t4) = t12;
    goto LAB8;

LAB12:    xsi_set_current_line(57, ng0);
    t8 = (t0 + 1992U);
    t9 = *((char **)t8);
    t19 = (64 - 64);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t8 = (t9 + t21);
    t10 = (t22 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 64;
    t11 = (t10 + 4U);
    *((int *)t11) = 32;
    t11 = (t10 + 8U);
    *((int *)t11) = -1;
    t23 = (32 - 64);
    t24 = (t23 * -1);
    t24 = (t24 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t24;
    t11 = (t0 + 1032U);
    t25 = *((char **)t11);
    t11 = (t0 + 5836U);
    t26 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t18, t8, t22, t25, t11);
    t27 = (t18 + 12U);
    t24 = *((unsigned int *)t27);
    t28 = (1U * t24);
    t6 = (33U != t28);
    if (t6 == 1)
        goto LAB15;

LAB16:    t29 = (t0 + 3672);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    memcpy(t33, t26, 33U);
    xsi_driver_first_trans_delta(t29, 0U, 33U, 0LL);
    xsi_set_current_line(58, ng0);
    t1 = (t0 + 1992U);
    t3 = *((char **)t1);
    t15 = (64 - 64);
    t16 = (t15 * 1U);
    t17 = (0 + t16);
    t1 = (t3 + t17);
    t4 = (t0 + 3672);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 64U);
    xsi_driver_first_trans_delta(t4, 1U, 64U, 0LL);
    goto LAB13;

LAB15:    xsi_size_not_matching(33U, t28, 0);
    goto LAB16;

}


extern void work_a_2568281640_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2568281640_3212880686_p_0};
	xsi_register_didat("work_a_2568281640_3212880686", "isim/testnewmult_isim_beh.exe.sim/work/a_2568281640_3212880686.didat");
	xsi_register_executes(pe);
}
