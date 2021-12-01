//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/SC Post Effects/SpeedLines" {
Properties {
}
SubShader {
 Pass {
  Name "Speedlines"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 33441
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _NoiseTex;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec2 u_xlat2;
bool u_xlatb3;
float u_xlat4;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat4 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat6 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat4 = u_xlat4 * u_xlat6;
    u_xlat6 = u_xlat4 * u_xlat4;
    u_xlat1.x = u_xlat6 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat6 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat6 * u_xlat1.x + -0.330299497;
    u_xlat6 = u_xlat6 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat6 * u_xlat4;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
    u_xlatb3 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1.x = u_xlatb3 ? u_xlat1.x : float(0.0);
    u_xlat4 = u_xlat4 * u_xlat6 + u_xlat1.x;
    u_xlatb6 = u_xlat0.y<(-u_xlat0.y);
    u_xlat6 = u_xlatb6 ? -3.14159274 : float(0.0);
    u_xlat4 = u_xlat6 + u_xlat4;
    u_xlat6 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb6 = u_xlat6<(-u_xlat6);
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.00999999978;
    u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
    u_xlatb6 = u_xlatb6 && u_xlatb1;
    u_xlat4 = (u_xlatb6) ? (-u_xlat4) : u_xlat4;
    u_xlat4 = u_xlat4 * 0.159154952 + 0.5;
    u_xlat6 = fract(_Time.w);
    u_xlat0.y = u_xlat4 * _Params.z + u_xlat6;
    u_xlat0 = texture(_NoiseTex, u_xlat0.xy);
    u_xlat2.xy = fract(vs_TEXCOORD0.xy);
    u_xlat2.xy = (-u_xlat2.xy) + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * vec2(1.42857146, 1.42857146);
    u_xlat2.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Params.y;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD1.xy);
    SV_Target0.xyz = _Params.xxx * u_xlat0.xxx + u_xlat1.xyz;
    SV_Target0.w = u_xlat1.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 281
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %11 %258 %262 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpDecorate vs_TEXCOORD0 Location 11 
                                              OpMemberDecorate %177 0 Offset 177 
                                              OpMemberDecorate %177 1 Offset 177 
                                              OpDecorate %177 Block 
                                              OpDecorate %179 DescriptorSet 179 
                                              OpDecorate %179 Binding 179 
                                              OpDecorate %198 DescriptorSet 198 
                                              OpDecorate %198 Binding 198 
                                              OpDecorate %202 DescriptorSet 202 
                                              OpDecorate %202 Binding 202 
                                              OpDecorate %253 DescriptorSet 253 
                                              OpDecorate %253 Binding 253 
                                              OpDecorate %255 DescriptorSet 255 
                                              OpDecorate %255 Binding 255 
                                              OpDecorate vs_TEXCOORD1 Location 258 
                                              OpDecorate %262 Location 262 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 2 
                                       %8 = OpTypePointer Private %7 
                        Private f32_2* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                  f32 %13 = OpConstant 3.674022E-40 
                                f32_2 %14 = OpConstantComposite %13 %13 
                                      %16 = OpTypePointer Private %6 
                         Private f32* %17 = OpVariable Private 
                                      %18 = OpTypeInt 32 0 
                                  u32 %19 = OpConstant 1 
                                  u32 %23 = OpConstant 0 
                                  f32 %28 = OpConstant 3.674022E-40 
                         Private f32* %31 = OpVariable Private 
                                      %45 = OpTypeVector %6 4 
                                      %46 = OpTypePointer Private %45 
                       Private f32_4* %47 = OpVariable Private 
                                  f32 %49 = OpConstant 3.674022E-40 
                                  f32 %51 = OpConstant 3.674022E-40 
                                  f32 %58 = OpConstant 3.674022E-40 
                                  f32 %65 = OpConstant 3.674022E-40 
                                  f32 %72 = OpConstant 3.674022E-40 
                                  f32 %80 = OpConstant 3.674022E-40 
                                  f32 %82 = OpConstant 3.674022E-40 
                                      %85 = OpTypeBool 
                                      %86 = OpTypePointer Private %85 
                        Private bool* %87 = OpVariable Private 
                                      %96 = OpTypePointer Function %6 
                                 f32 %103 = OpConstant 3.674022E-40 
                       Private bool* %112 = OpVariable Private 
                                 f32 %120 = OpConstant 3.674022E-40 
                                 f32 %150 = OpConstant 3.674022E-40 
                       Private bool* %153 = OpVariable Private 
                                 f32 %173 = OpConstant 3.674022E-40 
                                 f32 %175 = OpConstant 3.674022E-40 
                                     %177 = OpTypeStruct %45 %45 
                                     %178 = OpTypePointer Uniform %177 
     Uniform struct {f32_4; f32_4;}* %179 = OpVariable Uniform 
                                     %180 = OpTypeInt 32 1 
                                 i32 %181 = OpConstant 0 
                                 u32 %182 = OpConstant 3 
                                     %183 = OpTypePointer Uniform %6 
                                 i32 %188 = OpConstant 1 
                                 u32 %189 = OpConstant 2 
                                     %196 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %197 = OpTypePointer UniformConstant %196 
UniformConstant read_only Texture2D* %198 = OpVariable UniformConstant 
                                     %200 = OpTypeSampler 
                                     %201 = OpTypePointer UniformConstant %200 
            UniformConstant sampler* %202 = OpVariable UniformConstant 
                                     %204 = OpTypeSampledImage %196 
                      Private f32_2* %210 = OpVariable Private 
                               f32_2 %215 = OpConstantComposite %175 %175 
                                 f32 %218 = OpConstant 3.674022E-40 
                               f32_2 %219 = OpConstantComposite %218 %218 
UniformConstant read_only Texture2D* %253 = OpVariable UniformConstant 
            UniformConstant sampler* %255 = OpVariable UniformConstant 
                Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %261 = OpTypePointer Output %45 
                       Output f32_4* %262 = OpVariable Output 
                                     %263 = OpTypeVector %6 3 
                                     %264 = OpTypePointer Uniform %45 
                                     %278 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                        Function f32* %97 = OpVariable Function 
                       Function f32* %164 = OpVariable Function 
                                f32_2 %12 = OpLoad vs_TEXCOORD0 
                                f32_2 %15 = OpFAdd %12 %14 
                                              OpStore %9 %15 
                         Private f32* %20 = OpAccessChain %9 %19 
                                  f32 %21 = OpLoad %20 
                                  f32 %22 = OpExtInst %1 4 %21 
                         Private f32* %24 = OpAccessChain %9 %23 
                                  f32 %25 = OpLoad %24 
                                  f32 %26 = OpExtInst %1 4 %25 
                                  f32 %27 = OpExtInst %1 40 %22 %26 
                                              OpStore %17 %27 
                                  f32 %29 = OpLoad %17 
                                  f32 %30 = OpFDiv %28 %29 
                                              OpStore %17 %30 
                         Private f32* %32 = OpAccessChain %9 %19 
                                  f32 %33 = OpLoad %32 
                                  f32 %34 = OpExtInst %1 4 %33 
                         Private f32* %35 = OpAccessChain %9 %23 
                                  f32 %36 = OpLoad %35 
                                  f32 %37 = OpExtInst %1 4 %36 
                                  f32 %38 = OpExtInst %1 37 %34 %37 
                                              OpStore %31 %38 
                                  f32 %39 = OpLoad %17 
                                  f32 %40 = OpLoad %31 
                                  f32 %41 = OpFMul %39 %40 
                                              OpStore %17 %41 
                                  f32 %42 = OpLoad %17 
                                  f32 %43 = OpLoad %17 
                                  f32 %44 = OpFMul %42 %43 
                                              OpStore %31 %44 
                                  f32 %48 = OpLoad %31 
                                  f32 %50 = OpFMul %48 %49 
                                  f32 %52 = OpFAdd %50 %51 
                         Private f32* %53 = OpAccessChain %47 %23 
                                              OpStore %53 %52 
                                  f32 %54 = OpLoad %31 
                         Private f32* %55 = OpAccessChain %47 %23 
                                  f32 %56 = OpLoad %55 
                                  f32 %57 = OpFMul %54 %56 
                                  f32 %59 = OpFAdd %57 %58 
                         Private f32* %60 = OpAccessChain %47 %23 
                                              OpStore %60 %59 
                                  f32 %61 = OpLoad %31 
                         Private f32* %62 = OpAccessChain %47 %23 
                                  f32 %63 = OpLoad %62 
                                  f32 %64 = OpFMul %61 %63 
                                  f32 %66 = OpFAdd %64 %65 
                         Private f32* %67 = OpAccessChain %47 %23 
                                              OpStore %67 %66 
                                  f32 %68 = OpLoad %31 
                         Private f32* %69 = OpAccessChain %47 %23 
                                  f32 %70 = OpLoad %69 
                                  f32 %71 = OpFMul %68 %70 
                                  f32 %73 = OpFAdd %71 %72 
                                              OpStore %31 %73 
                                  f32 %74 = OpLoad %31 
                                  f32 %75 = OpLoad %17 
                                  f32 %76 = OpFMul %74 %75 
                         Private f32* %77 = OpAccessChain %47 %23 
                                              OpStore %77 %76 
                         Private f32* %78 = OpAccessChain %47 %23 
                                  f32 %79 = OpLoad %78 
                                  f32 %81 = OpFMul %79 %80 
                                  f32 %83 = OpFAdd %81 %82 
                         Private f32* %84 = OpAccessChain %47 %23 
                                              OpStore %84 %83 
                         Private f32* %88 = OpAccessChain %9 %19 
                                  f32 %89 = OpLoad %88 
                                  f32 %90 = OpExtInst %1 4 %89 
                         Private f32* %91 = OpAccessChain %9 %23 
                                  f32 %92 = OpLoad %91 
                                  f32 %93 = OpExtInst %1 4 %92 
                                 bool %94 = OpFOrdLessThan %90 %93 
                                              OpStore %87 %94 
                                 bool %95 = OpLoad %87 
                                              OpSelectionMerge %99 None 
                                              OpBranchConditional %95 %98 %102 
                                      %98 = OpLabel 
                        Private f32* %100 = OpAccessChain %47 %23 
                                 f32 %101 = OpLoad %100 
                                              OpStore %97 %101 
                                              OpBranch %99 
                                     %102 = OpLabel 
                                              OpStore %97 %103 
                                              OpBranch %99 
                                      %99 = OpLabel 
                                 f32 %104 = OpLoad %97 
                        Private f32* %105 = OpAccessChain %47 %23 
                                              OpStore %105 %104 
                                 f32 %106 = OpLoad %17 
                                 f32 %107 = OpLoad %31 
                                 f32 %108 = OpFMul %106 %107 
                        Private f32* %109 = OpAccessChain %47 %23 
                                 f32 %110 = OpLoad %109 
                                 f32 %111 = OpFAdd %108 %110 
                                              OpStore %17 %111 
                        Private f32* %113 = OpAccessChain %9 %19 
                                 f32 %114 = OpLoad %113 
                        Private f32* %115 = OpAccessChain %9 %19 
                                 f32 %116 = OpLoad %115 
                                 f32 %117 = OpFNegate %116 
                                bool %118 = OpFOrdLessThan %114 %117 
                                              OpStore %112 %118 
                                bool %119 = OpLoad %112 
                                 f32 %121 = OpSelect %119 %120 %103 
                                              OpStore %31 %121 
                                 f32 %122 = OpLoad %31 
                                 f32 %123 = OpLoad %17 
                                 f32 %124 = OpFAdd %122 %123 
                                              OpStore %17 %124 
                        Private f32* %125 = OpAccessChain %9 %19 
                                 f32 %126 = OpLoad %125 
                        Private f32* %127 = OpAccessChain %9 %23 
                                 f32 %128 = OpLoad %127 
                                 f32 %129 = OpExtInst %1 37 %126 %128 
                                              OpStore %31 %129 
                                 f32 %130 = OpLoad %31 
                                 f32 %131 = OpLoad %31 
                                 f32 %132 = OpFNegate %131 
                                bool %133 = OpFOrdLessThan %130 %132 
                                              OpStore %112 %133 
                        Private f32* %134 = OpAccessChain %9 %19 
                                 f32 %135 = OpLoad %134 
                        Private f32* %136 = OpAccessChain %9 %23 
                                 f32 %137 = OpLoad %136 
                                 f32 %138 = OpExtInst %1 40 %135 %137 
                        Private f32* %139 = OpAccessChain %47 %23 
                                              OpStore %139 %138 
                               f32_2 %140 = OpLoad %9 
                               f32_2 %141 = OpLoad %9 
                                 f32 %142 = OpDot %140 %141 
                        Private f32* %143 = OpAccessChain %9 %23 
                                              OpStore %143 %142 
                        Private f32* %144 = OpAccessChain %9 %23 
                                 f32 %145 = OpLoad %144 
                                 f32 %146 = OpExtInst %1 31 %145 
                        Private f32* %147 = OpAccessChain %9 %23 
                                              OpStore %147 %146 
                        Private f32* %148 = OpAccessChain %9 %23 
                                 f32 %149 = OpLoad %148 
                                 f32 %151 = OpFMul %149 %150 
                        Private f32* %152 = OpAccessChain %9 %23 
                                              OpStore %152 %151 
                        Private f32* %154 = OpAccessChain %47 %23 
                                 f32 %155 = OpLoad %154 
                        Private f32* %156 = OpAccessChain %47 %23 
                                 f32 %157 = OpLoad %156 
                                 f32 %158 = OpFNegate %157 
                                bool %159 = OpFOrdGreaterThanEqual %155 %158 
                                              OpStore %153 %159 
                                bool %160 = OpLoad %112 
                                bool %161 = OpLoad %153 
                                bool %162 = OpLogicalAnd %160 %161 
                                              OpStore %112 %162 
                                bool %163 = OpLoad %112 
                                              OpSelectionMerge %166 None 
                                              OpBranchConditional %163 %165 %169 
                                     %165 = OpLabel 
                                 f32 %167 = OpLoad %17 
                                 f32 %168 = OpFNegate %167 
                                              OpStore %164 %168 
                                              OpBranch %166 
                                     %169 = OpLabel 
                                 f32 %170 = OpLoad %17 
                                              OpStore %164 %170 
                                              OpBranch %166 
                                     %166 = OpLabel 
                                 f32 %171 = OpLoad %164 
                                              OpStore %17 %171 
                                 f32 %172 = OpLoad %17 
                                 f32 %174 = OpFMul %172 %173 
                                 f32 %176 = OpFAdd %174 %175 
                                              OpStore %17 %176 
                        Uniform f32* %184 = OpAccessChain %179 %181 %182 
                                 f32 %185 = OpLoad %184 
                                 f32 %186 = OpExtInst %1 10 %185 
                                              OpStore %31 %186 
                                 f32 %187 = OpLoad %17 
                        Uniform f32* %190 = OpAccessChain %179 %188 %189 
                                 f32 %191 = OpLoad %190 
                                 f32 %192 = OpFMul %187 %191 
                                 f32 %193 = OpLoad %31 
                                 f32 %194 = OpFAdd %192 %193 
                        Private f32* %195 = OpAccessChain %9 %19 
                                              OpStore %195 %194 
                 read_only Texture2D %199 = OpLoad %198 
                             sampler %203 = OpLoad %202 
          read_only Texture2DSampled %205 = OpSampledImage %199 %203 
                               f32_2 %206 = OpLoad %9 
                               f32_4 %207 = OpImageSampleImplicitLod %205 %206 
                                 f32 %208 = OpCompositeExtract %207 0 
                        Private f32* %209 = OpAccessChain %9 %23 
                                              OpStore %209 %208 
                               f32_2 %211 = OpLoad vs_TEXCOORD0 
                               f32_2 %212 = OpExtInst %1 10 %211 
                                              OpStore %210 %212 
                               f32_2 %213 = OpLoad %210 
                               f32_2 %214 = OpFNegate %213 
                               f32_2 %216 = OpFAdd %214 %215 
                                              OpStore %210 %216 
                               f32_2 %217 = OpLoad %210 
                               f32_2 %220 = OpFMul %217 %219 
                                              OpStore %210 %220 
                               f32_2 %221 = OpLoad %210 
                               f32_2 %222 = OpLoad %210 
                                 f32 %223 = OpDot %221 %222 
                        Private f32* %224 = OpAccessChain %210 %23 
                                              OpStore %224 %223 
                        Private f32* %225 = OpAccessChain %210 %23 
                                 f32 %226 = OpLoad %225 
                                 f32 %227 = OpExtInst %1 31 %226 
                        Private f32* %228 = OpAccessChain %210 %23 
                                              OpStore %228 %227 
                        Private f32* %229 = OpAccessChain %210 %23 
                                 f32 %230 = OpLoad %229 
                                 f32 %231 = OpExtInst %1 30 %230 
                        Private f32* %232 = OpAccessChain %210 %23 
                                              OpStore %232 %231 
                        Private f32* %233 = OpAccessChain %210 %23 
                                 f32 %234 = OpLoad %233 
                        Uniform f32* %235 = OpAccessChain %179 %188 %19 
                                 f32 %236 = OpLoad %235 
                                 f32 %237 = OpFMul %234 %236 
                        Private f32* %238 = OpAccessChain %210 %23 
                                              OpStore %238 %237 
                        Private f32* %239 = OpAccessChain %210 %23 
                                 f32 %240 = OpLoad %239 
                                 f32 %241 = OpExtInst %1 29 %240 
                        Private f32* %242 = OpAccessChain %210 %23 
                                              OpStore %242 %241 
                        Private f32* %243 = OpAccessChain %210 %23 
                                 f32 %244 = OpLoad %243 
                                 f32 %245 = OpExtInst %1 37 %244 %28 
                        Private f32* %246 = OpAccessChain %210 %23 
                                              OpStore %246 %245 
                        Private f32* %247 = OpAccessChain %210 %23 
                                 f32 %248 = OpLoad %247 
                        Private f32* %249 = OpAccessChain %9 %23 
                                 f32 %250 = OpLoad %249 
                                 f32 %251 = OpFMul %248 %250 
                        Private f32* %252 = OpAccessChain %9 %23 
                                              OpStore %252 %251 
                 read_only Texture2D %254 = OpLoad %253 
                             sampler %256 = OpLoad %255 
          read_only Texture2DSampled %257 = OpSampledImage %254 %256 
                               f32_2 %259 = OpLoad vs_TEXCOORD1 
                               f32_4 %260 = OpImageSampleImplicitLod %257 %259 
                                              OpStore %47 %260 
                      Uniform f32_4* %265 = OpAccessChain %179 %188 
                               f32_4 %266 = OpLoad %265 
                               f32_3 %267 = OpVectorShuffle %266 %266 0 0 0 
                               f32_2 %268 = OpLoad %9 
                               f32_3 %269 = OpVectorShuffle %268 %268 0 0 0 
                               f32_3 %270 = OpFMul %267 %269 
                               f32_4 %271 = OpLoad %47 
                               f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                               f32_3 %273 = OpFAdd %270 %272 
                               f32_4 %274 = OpLoad %262 
                               f32_4 %275 = OpVectorShuffle %274 %273 4 5 6 3 
                                              OpStore %262 %275 
                        Private f32* %276 = OpAccessChain %47 %182 
                                 f32 %277 = OpLoad %276 
                         Output f32* %279 = OpAccessChain %262 %182 
                                              OpStore %279 %277 
                                              OpReturn
                                              OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
}
}
}
}