// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/ChangeableSkybox" {
Properties {
	_FrontTex1 ("Front1 (+Z)", 2D) = "white" {}
	_BackTex1 ("Back1 (-Z)", 2D) = "white" {}
	_LeftTex1 ("Left1 (+X)", 2D) = "white" {}
	_RightTex1 ("Right1 (-X)", 2D) = "white" {}
	_UpTex1 ("Up1 (+Y)", 2D) = "white" {}
	_DownTex1 ("Down1 (-Y)", 2D) = "white" {}

	_FrontTex2 ("Front2 (+Z)", 2D) = "white" {}
	_BackTex2 ("Back2 (-Z)", 2D) = "white" {}
	_LeftTex2 ("Left2 (+X)", 2D) = "white" {}
	_RightTex2 ("Right2 (-X)", 2D) = "white" {}
	_UpTex2 ("Up2 (+Y)", 2D) = "white" {}
	_DownTex2 ("Down2 (-Y)", 2D) = "white" {}

	_FlagTex ("FlagRT", 2D) = "white" {}
}

SubShader {
	Tags { "Queue"="Background" "RenderType"="Background" }
	Cull Off ZWrite Off Fog { Mode Off }

	Pass {
		CGPROGRAM
		#pragma vertex vert
		#pragma fragment frag
		
		#include "UnityCG.cginc"

		 struct appdata
        {
            float4 vertex : POSITION;
            float2 uv : TEXCOORD0;
        };

        struct v2f
        {
            float2 uv : TEXCOORD0;
            UNITY_FOG_COORDS(1)
            float4 vertex : SV_POSITION;
        };

        sampler2D _FrontTex1;
		float4 _FrontTex1_ST;
        sampler2D _FrontTex2;
		sampler2D _FlagTex;

        v2f vert (appdata v)
        {
            v2f o;
            o.vertex = UnityObjectToClipPos(v.vertex);
            o.uv = TRANSFORM_TEX(v.uv, _FrontTex1);
            UNITY_TRANSFER_FOG(o,o.vertex);
            return o;
        }

        fixed4 frag (v2f i) : SV_Target
        {
            if (tex2D(_FlagTex, float2(0, 0)).g < 1.0f) {
				return tex2D(_FrontTex1, i.uv);
			} else {
				return tex2D(_FrontTex2, i.uv);
			}
        }
        ENDCG
	}
	Pass {
		CGPROGRAM
		#pragma vertex vert
		#pragma fragment frag
		
		#include "UnityCG.cginc"

		 struct appdata
        {
            float4 vertex : POSITION;
            float2 uv : TEXCOORD0;
        };

        struct v2f
        {
            float2 uv : TEXCOORD0;
            UNITY_FOG_COORDS(1)
            float4 vertex : SV_POSITION;
        };

        sampler2D _BackTex1;
		float4 _BackTex1_ST;
        sampler2D _BackTex2;
		sampler2D _FlagTex;

        v2f vert (appdata v)
        {
            v2f o;
            o.vertex = UnityObjectToClipPos(v.vertex);
            o.uv = TRANSFORM_TEX(v.uv, _BackTex1);
            UNITY_TRANSFER_FOG(o,o.vertex);
            return o;
        }

        fixed4 frag (v2f i) : SV_Target
        {
            if (tex2D(_FlagTex, float2(0, 0)).g < 1.0f) {
				return tex2D(_BackTex1, i.uv);
			} else {
				return tex2D(_BackTex2, i.uv);
			}
        }
        ENDCG
	}
	Pass {
		CGPROGRAM
		#pragma vertex vert
		#pragma fragment frag
		
		#include "UnityCG.cginc"

		 struct appdata
        {
            float4 vertex : POSITION;
            float2 uv : TEXCOORD0;
        };

        struct v2f
        {
            float2 uv : TEXCOORD0;
            UNITY_FOG_COORDS(1)
            float4 vertex : SV_POSITION;
        };

        sampler2D _LeftTex1;
		float4 _LeftTex1_ST;
        sampler2D _LeftTex2;
		sampler2D _FlagTex;

        v2f vert (appdata v)
        {
            v2f o;
            o.vertex = UnityObjectToClipPos(v.vertex);
            o.uv = TRANSFORM_TEX(v.uv, _LeftTex1);
            UNITY_TRANSFER_FOG(o,o.vertex);
            return o;
        }

        fixed4 frag (v2f i) : SV_Target
        {
            if (tex2D(_FlagTex, float2(0, 0)).g < 1.0f) {
				return tex2D(_LeftTex1, i.uv);
			} else {
				return tex2D(_LeftTex2, i.uv);
			}
        }
        ENDCG
	}
	Pass {
		CGPROGRAM
		#pragma vertex vert
		#pragma fragment frag
		
		#include "UnityCG.cginc"

		 struct appdata
        {
            float4 vertex : POSITION;
            float2 uv : TEXCOORD0;
        };

        struct v2f
        {
            float2 uv : TEXCOORD0;
            UNITY_FOG_COORDS(1)
            float4 vertex : SV_POSITION;
        };

        sampler2D _RightTex1;
		float4 _RightTex1_ST;
        sampler2D _RightTex2;
		sampler2D _FlagTex;

        v2f vert (appdata v)
        {
            v2f o;
            o.vertex = UnityObjectToClipPos(v.vertex);
            o.uv = TRANSFORM_TEX(v.uv, _RightTex1);
            UNITY_TRANSFER_FOG(o,o.vertex);
            return o;
        }

        fixed4 frag (v2f i) : SV_Target
        {
            if (tex2D(_FlagTex, float2(0, 0)).g < 1.0f) {
				return tex2D(_RightTex1, i.uv);
			} else {
				return tex2D(_RightTex2, i.uv);
			}
        }
        ENDCG	
	}
	Pass {
		CGPROGRAM
		#pragma vertex vert
		#pragma fragment frag
		
		#include "UnityCG.cginc"

		 struct appdata
        {
            float4 vertex : POSITION;
            float2 uv : TEXCOORD0;
        };

        struct v2f
        {
            float2 uv : TEXCOORD0;
            UNITY_FOG_COORDS(1)
            float4 vertex : SV_POSITION;
        };

        sampler2D _UpTex1;
		float4 _UpTex1_ST;
        sampler2D _UpTex2;
		sampler2D _FlagTex;

        v2f vert (appdata v)
        {
            v2f o;
            o.vertex = UnityObjectToClipPos(v.vertex);
            o.uv = TRANSFORM_TEX(v.uv, _UpTex1);
            UNITY_TRANSFER_FOG(o,o.vertex);
            return o;
        }

        fixed4 frag (v2f i) : SV_Target
        {
            if (tex2D(_FlagTex, float2(0, 0)).g < 1.0f) {
				return tex2D(_UpTex1, i.uv);
			} else {
				return tex2D(_UpTex2, i.uv);
			}
        }
        ENDCG		
	}
	Pass {
		CGPROGRAM
		#pragma vertex vert
		#pragma fragment frag
		
		#include "UnityCG.cginc"

		 struct appdata
        {
            float4 vertex : POSITION;
            float2 uv : TEXCOORD0;
        };

        struct v2f
        {
            float2 uv : TEXCOORD0;
            UNITY_FOG_COORDS(1)
            float4 vertex : SV_POSITION;
        };

        sampler2D _DownTex1;
		float4 _DownTex1_ST;
        sampler2D _DownTex2;
		sampler2D _FlagTex;

        v2f vert (appdata v)
        {
            v2f o;
            o.vertex = UnityObjectToClipPos(v.vertex);
            o.uv = TRANSFORM_TEX(v.uv, _DownTex1);
            UNITY_TRANSFER_FOG(o,o.vertex);
            return o;
        }

        fixed4 frag (v2f i) : SV_Target
        {
            if (tex2D(_FlagTex, float2(0, 0)).g < 1.0f) {
				return tex2D(_DownTex1, i.uv);
			} else {
				return tex2D(_DownTex2, i.uv);
			}
        }
        ENDCG	
	}


}
}