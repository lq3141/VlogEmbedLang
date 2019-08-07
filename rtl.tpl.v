// AUTO CODE, don't edit!
//
module __MOD_NAME__
    #(parameter BASE_ADDR=0
    )
    (
    input               clk,
    input               rst,

    input     [__BUS_AWID__-1:0]  bif_addr,

    input               bif_sel,
    input               bif_wr_ev,
    input               bif_rd_ev,

    input     [__BUS_DWID__-1:0]  bif_wr_dat,
    output reg[__BUS_DWID__-1:0]  bif_rd_dat,
    output reg                    bif_rd_vld_ev,

    // config bus
    //__ ITR_FIELD:PORT DEF BEGIN(py:ctx['field']['attr']['acc']['type']=='intact' or ctx['field']['split_idx']==0)
    __SIG_DIR__ __SIG_WID_DEF__ __SIG_NAME__,
    //__ ITR_FIELD:PORT DEF END

    // dummy
    output              tie0
    );

    `include "__MOD_NAME__.vh"

    assign tie0 = 1'b0;

    // access block
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            //__ ITR_FIELD:SIG RESET BEGIN(py:ctx['field']['acc']!='r' and (('split_idx' not in ctx['field']) or (ctx['field']['split_idx']==0)))
            __SIG_NAME__ __WR_LHE_ALIGN__<= __SIG_WID__'__INIT_TYPE____RESET_VALUE__; // __RESET_VALUE_HEX__
            //__ ITR_FIELD:SIG RESET END

            bif_rd_vld_ev <= 1'b0;
            bif_rd_dat    <= {__BUS_DWID__{1'b0}};
        end else begin
            /* write access block */
            //__ ITR_FIELD:SIG ACC PRE BEGIN(py:ctx['field']['acc']=='w1')
            __SIG_NAME__ __WR_LHE_ALIGN__<= 1'b0;
            //__ ITR_FIELD:SIG ACC PRE END

            if (bif_wr_ev && bif_sel) begin
                //__ ITR_REG:REG WR ACC BEGIN
                if (bif_addr == __ADDR_NAME__) begin
                    //__ WR NORMAL ACC BEGIN(:PRE:EQ glb_shadow_en 0)
                    //__ ITR_FIELD:NORMAL WR ACC BEGIN(py:ctx['field']['acc']!='r')
                    __SIG_NAME____SIG_BIT_RANGE__ __WR_LHE_ALIGN__<= bif_wr_dat__BUS_BIT_RANGE__;
                    //__ ITR_FIELD:NORMAL WR ACC END
                    //__ WR NORMAL ACC END
                    //__ WR SHADOW ACC BEGIN(:PRE:EQ glb_shadow_en 1)
                    //__ ITR_FIELD:NORMAL ACC OF SHADOW WR BEGIN(py:ctx['shadow_en']==0 and (ctx['field']['acc']!='r' or ctx['shadow_type']=='r'))
                    __SIG_NAME____SIG_BIT_RANGE__ __WR_LHE_ALIGN__<= bif_wr_dat__BUS_BIT_RANGE__;
                    //__ ITR_FIELD:NORMAL ACC OF SHADOW WR END
                    //__ ITR_FIELD:SHADOW WR BEGIN(py:ctx['field']['acc']!='r' and ctx['shadow_en']==1 and ctx['shadow_type']=='w' and ctx['shadow_trigger']==0)
                    if (shadow_en) begin
                        shadow__SIG_BIT_RANGE__ __WR_LHE_ALIGN__<= bif_wr_dat__BUS_BIT_RANGE__;
                    end else begin
                        __SIG_NAME____SIG_BIT_RANGE__ __WR_LHE_ALIGN__<= bif_wr_dat__BUS_BIT_RANGE__;
                    end
                    //__ ITR_FIELD:SHADOW WR END
                    //__ ITR_FIELD:SHADOW WR TRIG BEGIN(py:ctx['field']['acc']!='r' and ctx['shadow_type']=='w' and ctx['shadow_trigger']==1)
                    if (shadow_en) begin
                        shadow__SIG_BIT_RANGE__ <= bif_wr_dat__BUS_BIT_RANGE__;
                        __SIG_NAME____SIG_BIT_RANGE__ <= bif_wr_dat__BUS_BIT_RANGE__;
                        __SIG_NAME__[__SHADOW_UNLOAD_WID__-1:0] <= shadow[__SHADOW_UNLOAD_WID__-1:0];
                    end else begin
                        __SIG_NAME____SIG_BIT_RANGE__ __WR_LHE_ALIGN__<= bif_wr_dat__BUS_BIT_RANGE__;
                    end
                    //__ ITR_FIELD:SHADOW WR TRIG END
                    //__ WR SHADOW ACC END
                end
                //__ ITR_REG:REG WR ACC END
            end

            /* read access block */
            bif_rd_vld_ev <= 1'b0;
            bif_rd_dat    <= {__BUS_DWID__{1'b0}};
            if (bif_rd_ev) begin
                bif_rd_vld_ev <= 1'b1;
                case (bif_addr)
                    //__ ITR_REG:REG RD ACC BEGIN
                    __ADDR_NAME__ : begin
                        //__ RD NORMAL ACC BEGIN(:PRE:EQ glb_shadow_en 0)
                        //__ ITR_FIELD:RD ACC BEGIN
                        bif_rd_dat__BUS_BIT_RANGE__ <= __SIG_NAME____SIG_BIT_RANGE__;
                        //__ ITR_FIELD:RD ACC END
                        //__ RD NORMAL ACC END
                        //__ RD SHADOW ACC BEGIN(:PRE:EQ glb_shadow_en 1)
                        //__ ITR_FIELD:RD ACC BEGIN(py:ctx['shadow_en']==0 or ctx['shadow_type']=='w')
                        bif_rd_dat__BUS_BIT_RANGE__ <= __SIG_NAME____SIG_BIT_RANGE__;
                        //__ ITR_FIELD:RD ACC END
                        //__ ITR_FIELD:SHADOW RD ACC BEGIN(py:ctx['shadow_en']==1 and ctx['shadow_type']=='r' and ctx['shadow_trigger']==0)
                        if (shadow_en) begin
                            bif_rd_dat__BUS_BIT_RANGE__ <= shadow__SIG_BIT_RANGE__;
                        end else begin
                            bif_rd_dat__BUS_BIT_RANGE__ <= __SIG_NAME____SIG_BIT_RANGE__;
                        end
                        //__ ITR_FIELD:SHADOW RD ACC END
                        //__ ITR_FIELD:SHADOW RD TRIG BEGIN(py:ctx['shadow_en']==1 and ctx['shadow_type']=='r' and ctx['shadow_trigger']==1)
                        if (shadow_en) begin
                            bif_rd_dat__BUS_BIT_RANGE__ <= __SIG_NAME____SIG_BIT_RANGE__;
                            shadow[__SIG_WID__-1:0] <= __SIG_NAME__[__SIG_WID__-1:0];
                        end else begin
                            bif_rd_dat__BUS_BIT_RANGE__ <= __SIG_NAME____SIG_BIT_RANGE__;
                        end
                        //__ ITR_FIELD:SHADOW RD TRIG END
                        //__ RD SHADOW ACC END
                    end
                    //__ ITR_REG:REG RD ACC END
                    default:    bif_rd_vld_ev <= 1'b0;
                endcase
            end
        end
    end

endmodule

